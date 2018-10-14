FROM parity/parity:v2.1.2

MAINTAINER Gregoire Jeanmart <gregoire.jeanmart@consensys.net> version: 0.2

USER root

# Install
RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install build-essential
RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get -y install nodejs
RUN npm install -g web3 --unsafe-perm

# Env
ENV PATH="/home/parity/bin:${PATH}"
ENV TRANSFER_AMOUNT 5
ENV NODE_PATH /usr/lib/node_modules

# Entry point
ENTRYPOINT ["sh", "run-parity.sh"]

# Scripts
ADD .scripts/run-parity.sh .
ADD .scripts/transfer-ether.js /docker-scripts/transfer-ether.js
ADD .scripts/parity-block-scheduler.js /docker-scripts/parity-block-scheduler.js

# Ports
EXPOSE 8545 8180