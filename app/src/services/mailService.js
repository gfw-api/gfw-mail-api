'use strict';

var logger = require('logger');
var config = require('config');
var SparkPost = require('sparkpost');

var sendMailThunk = function (client, reqOpts) {
    return function (callback) {
        client.transmissions.send(reqOpts, callback);
    };
};

class MailService {

    constructor() {
        this.client = new SparkPost(config.get('sparkpost.apikey'));
        this.rwClient = new SparkPost(config.get('sparkpost.rwApikey'));
    }

    * sendMail(template, data, recipients) {
        logger.info('Sending email with template %s to recipients: ', template, recipients);
        let reqOpts = {
            transmissionBody: {
                substitution_data: data,
                content: {
                    template_id: template
                },
                recipients: recipients
            }
        };

        let response = yield sendMailThunk(this.client, reqOpts);
        logger.debug('Email send correctly!!');
        return response;
    }

    * sendRWMail(template, data, recipients) {
        logger.info('Sending email with template %s to recipients: ', template, recipients);
        let reqOpts = {
            transmissionBody: {
                substitution_data: data,
                content: {
                    template_id: template
                },
                recipients: recipients
            }
        };

        let response = yield sendMailThunk(this.rwClient, reqOpts);
        logger.debug('Email send correctly!!');
        return response;
    }
}

module.exports = new MailService();
