import nock from 'nock';
import config from 'config';
import { getTestServer } from './utils/test-server';
import { createClient } from 'redis';

nock.disableNetConnect();
nock.enableNetConnect(process.env.HOST_IP);

let requester: ChaiHttp.Agent;

const CHANNEL: string = config.get('apiGateway.queueName');
const redisClient = createClient({ url: config.get('apiGateway.queueUrl') });

describe('MailQueue ', () => {

    before(async () => {
        if (process.env.NODE_ENV !== 'test') {
            throw Error(`Running the test suite with NODE_ENV ${process.env.NODE_ENV} may result in permanent data loss. Please use NODE_ENV=test.`);
        }

        requester = await getTestServer();
        await redisClient.connect();
    });

    it('Test fires-notification-en message received triggers emails sent', async () => {
        const message: string = JSON.stringify({
            template: 'fires-notification-en',
            data: {
                value: 3578,
                alert_count: 3578,
                // @ts-ignore
                map_image: null,
                layerSlug: 'viirs-active-fires',
                alert_name: 'Subscription r6iigdoexerhgoq63l3di',
                selected_area: 'Custom Area',
                unsubscribe_url: 'http://127.0.0.1:9000/subscriptions/5cb87d04e209d34b76a55425/unsubscribe?redirect=true',
                subscriptions_url: 'http://staging.globalforestwatch.org/my_gfw/subscriptions',
                alert_link: 'http://staging.globalforestwatch.org/map/3/0/0/ALL/grayscale/viirs_fires_alerts?begin=2019-04-17&end=2019-04-18&fit_to_geom=true&geostore=agpzfmdmdy1hcGlzchULEghHZW9zdG9yZRiAgIDIjJfRCAw',
                alert_date_begin: '2019-04-17',
                alert_date_end: '2019-04-18'
            },
            recipients: [
                {
                    address: {
                        email: 'subscription-recipient@vizzuality.com'
                    }
                }
            ],
            sender: 'gfw'
        })

        const handleSparkpostCall = (resolve: () => void) => {
            nock('https://api.sparkpost.com')
                .post(`/api/v1/transmissions`, {
                    substitution_data: {
                        value: 3578,
                        alert_count: 3578,
                        map_image: null,
                        layerSlug: 'viirs-active-fires',
                        alert_name: 'Subscription r6iigdoexerhgoq63l3di',
                        selected_area: 'Custom Area',
                        unsubscribe_url: 'http://127.0.0.1:9000/subscriptions/5cb87d04e209d34b76a55425/unsubscribe?redirect=true',
                        subscriptions_url: 'http://staging.globalforestwatch.org/my_gfw/subscriptions',
                        alert_link: 'http://staging.globalforestwatch.org/map/3/0/0/ALL/grayscale/viirs_fires_alerts?begin=2019-04-17&end=2019-04-18&fit_to_geom=true&geostore=agpzfmdmdy1hcGlzchULEghHZW9zdG9yZRiAgIDIjJfRCAw',
                        alert_date_begin: '2019-04-17',
                        alert_date_end: '2019-04-18'
                    },
                    content: {
                        template_id: 'fires-notification-en'
                    },
                    recipients: [
                        {
                            address: {
                                email: 'subscription-recipient@vizzuality.com'
                            }
                        }
                    ]
                })
                .reply(200, () => {
                    resolve()
                });
        };

        return new Promise((resolve) => {
            const returnPromise = handleSparkpostCall(resolve)
            redisClient.publish(CHANNEL, message);
            return returnPromise;
        });
    });


    afterEach(() => {
        redisClient.removeAllListeners();

        if (!nock.isDone()) {
            throw new Error(`Not all nock interceptors were used: ${nock.pendingMocks()}`);
        }
    });
});
