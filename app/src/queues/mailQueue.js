const config = require('config');
const logger = require('logger');
const AsyncClient = require('vizz.async-client');
const mailService = require('services/mailService');

const CHANNEL = config.get('apiGateway.queueName');

class MailQueue {

    constructor() {
        logger.info('Initializing queue with provider %s ', config.get('apiGateway.queueProvider'));
        switch (config.get('apiGateway.queueProvider').toLowerCase()) {

            case AsyncClient.REDIS:
                this.asynClient = new AsyncClient(AsyncClient.REDIS, {
                    url: config.get('apiGateway.queueUrl')
                });
                break;
            default:

        }
        const channelSubscribe = this.asynClient.toChannel(CHANNEL);
        channelSubscribe.on('message', this.sendMail.bind(this));
        channelSubscribe.subscribe();
    }

    * sendMail(channel, mess) {
        logger.info('Receive message. Send Mail. Message: %s', mess);

        const message = JSON.parse(mess);

        try {
            yield mailService.sendMail(message.template, message.data, message.recipients);
            logger.debug('Message send correctly');
        } catch (e) {
            logger.error('Error sending email:', e);
        }
    }

}


module.exports = new MailQueue();
