#!/bin/bash
set -x

ssh-keyscan -H $DEPLOY_HOST >> $HOME/.ssh/known_hosts
# Import the SSH deployment key
openssl aes-256-cbc -K $encrypted_449cc4b7297e_key -iv $encrypted_449cc4b7297e_iv -in deploy-key.enc -out deploy-key -d
rm deploy-key.enc # Don't need it anymore
chmod 600 deploy-key
mv deploy-key ~/.ssh/id_rsa
