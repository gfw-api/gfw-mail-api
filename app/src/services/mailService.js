const logger = require('logger');
const config = require('config');
const SparkPost = require('sparkpost');

const sendMailThunk = function (client, reqOpts) {
    return function (callback) {
        client.transmissions.send(reqOpts, callback);
    };
};

class MailService {

    constructor() {
        this.client = new SparkPost(config.get('sparkpost.apikey'));
    }

    * sendMail(template, data, recipients) {
        logger.info('Sending email with template %s to recipients: ', template, recipients);
        const reqOpts = {
            substitution_data: data,
            content: {
                template_id: template
            },
            recipients
        };

        const response = yield sendMailThunk(this.client, reqOpts);
        logger.debug('Email sent correctly!!');
        return response;
    }

}

module.exports = new MailService();
