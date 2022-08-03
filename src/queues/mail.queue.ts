import SparkPost from 'sparkpost';
import config from 'config';
import logger from 'logger';
import { createClient, RedisClientType } from 'redis';
import MailService from 'services/mail.service';

const CHANNEL: string = config.get('apiGateway.queueName');

export type MailQueueMessage = {
    template: string,
    data: Record<string, any>,
    recipients: SparkPost.Recipient[],
    sender: string,
};

class MailQueue {

    redisClient: RedisClientType
    #isConnected: boolean = false

    constructor() {
        logger.info('Initializing redis queue subscriber');

        this.redisClient = createClient({ url: config.get('apiGateway.queueUrl') });
        this.redisClient.subscribe(CHANNEL, MailQueue.processMessage);
        logger.info('[MailQueue] MailQueue listener initialized');
    }

    async connect(): Promise<boolean> {
        if (!this.#isConnected) {
            await this.redisClient.connect();
            this.#isConnected = true;
        }
        return true;
    }

    static async processMessage(message: string): Promise<void> {
        logger.info('Receive message. Send Mail. Message: %s', message);

        const parsedMessage: MailQueueMessage = JSON.parse(message);

        try {
            await MailService.sendMail(parsedMessage.template, parsedMessage.data, parsedMessage.recipients);
            logger.debug('Message sent correctly');
        } catch (e) {
            logger.error('Error sending email:', e);
        }
    }

}

export default MailQueue;
