import logger from 'logger';
import MailQueue from 'queues/mail.queue';

const loadQueues: () => void = () => {
    logger.info('Loading queues...');
    new MailQueue()

    logger.info('Loaded queues correctly!');
}

export default loadQueues;
