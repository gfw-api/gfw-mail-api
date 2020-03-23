/* eslint-disable import/no-dynamic-require */
const fs = require('fs');
const logger = require('logger');

const queuesPath = `${__dirname}/queues`;

module.exports = (() => {

    const loadQueue = (app, path) => {
        logger.debug('Loading queues...');
        const routesFiles = fs.readdirSync(path);
        routesFiles.forEach((file) => {
            const newPath = path ? (`${path}/${file}`) : file;
            const stat = fs.statSync(newPath);

            if (!stat.isDirectory()) {
                if (file.lastIndexOf('Queue.js') !== -1) {
                    logger.debug('Loading queue %s', newPath);
                    require(newPath);
                }
            } else {
                // is folder
                loadQueue(app, newPath);
            }
        });
    };

    const loadQueues = (app) => {
        logger.debug('Loading queues...');
        loadQueue(app, queuesPath);
        logger.debug('Loaded queues correctly!');
    };

    return {
        loadQueues
    };

})();
