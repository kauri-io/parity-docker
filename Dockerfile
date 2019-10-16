FROM parity/parity:v2.5.9-stable

MAINTAINER Gregoire Jeanmart <gregoire.jeanmart@consensys.net> version: 0.2

USER root

# Env
ENV PATH="/home/parity/bin:${PATH}"
ENV TRANSFER_AMOUNT 5
ENV NODE_PATH /usr/lib/node_modules

# Install
RUN apt-get update && apt-get install -y curl git build-essential apt-transport-https
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get -y install nodejs
RUN npm install -g web3 --unsafe-perm


# Entry point
ENTRYPOINT ["sh", "run-parity.sh"]

# Scripts
ADD .scripts/run-parity.sh .
ADD .scripts/transfer-ether.js /docker-scripts/transfer-ether.js
ADD .scripts/parity-block-scheduler.js /docker-scripts/parity-block-scheduler.js

# Ports
EXPOSE 8545 8546 8180
