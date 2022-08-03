import config from 'config';
import logger from 'logger';
import SparkPost from 'sparkpost';

class MailService {
    static client: SparkPost = new SparkPost(config.get('sparkpost.apikey'));

    static async sendMail(template: string, data: Record<string, any>, recipients: SparkPost.Recipient[]): Promise<{ results: { total_rejected_recipients: number; total_accepted_recipients: number; id: string } }> {
        logger.info('Sending email with template %s to recipients: ', template, recipients);

        const linkTrackingEnabled: boolean = `${config.get('sparkpost.linkTrackingEnabled')}`.toLowerCase() === 'true';

        const reqOpts: SparkPost.CreateTransmission = {
            substitution_data: data,
            content: {
                template_id: template
            },
            recipients
        };

        if (!linkTrackingEnabled) {
            reqOpts.options = {
                open_tracking: false,
                click_tracking: false
            }
        }

        return MailService.client.transmissions.send(reqOpts)
    }

}

export default MailService
