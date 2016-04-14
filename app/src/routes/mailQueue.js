'use strict';
var config = require('config');
var logger = require('logger');
var AsyncClient = require('async-client');
var mailService = require('services/mailService');
const CHANNEL = 'mail';

class MailQueue {
    constructor() {
        this.asynClient = new AsyncClient(AsyncClient.REDIS, {
            url: config.get('apiGateway.queue')
        });

        var channelSubscribe = this.asynClient.toChannel(CHANNEL);
        channelSubscribe.on('message', MailQueue.sendMail);
        channelSubscribe.subscribe();
    }

    static * sendMail(channel, mess) {
        logger.info('Receive message. Send Mail. Message: %s', mess);

        let message = JSON.parse(mess);

        try {
            let response = yield mailService.sendMail(message.template, message.data, message.recipients);
            logger.debug('Message send correctly');
        } catch (e) {
            logger.error('Error to send mail', e);
        }
    }
}


module.exports = new MailQueue();
