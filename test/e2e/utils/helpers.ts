import config from 'config';
import Sinon, { SinonSandbox } from 'sinon';

export const stubConfigValue: (sandbox: Sinon.SinonSandbox, stubMap: Record<string, any>) => void = (sandbox: SinonSandbox, stubMap: Record<string, any>): void => {
    const stub: any = sandbox.stub(config, 'get');
    Object.keys(stubMap).forEach(key => {
        stub.withArgs(key).returns(stubMap[key]);
    });
    stub.callThrough();
};
