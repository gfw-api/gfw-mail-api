import logger from 'logger';
import MailQueue from 'queues/mail.queue';

const loadQueues: () => void = async () => {
    logger.info('Loading queues...');
    const mailQueue: MailQueue = new MailQueue();
    await mailQueue.connect();
    logger.info('Loaded queues correctly!');
}

export default loadQueues;
