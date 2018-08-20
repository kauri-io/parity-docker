FROM parity/parity:v1.11.4

MAINTAINER Gregoire Jeanmart <gregoire.jeanmart@consensys.net> version: 0.1

# Install
RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install build-essential
RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get -y install nodejs
RUN sudo npm install -g web3 --unsafe-perm

ENV NODE_PATH /usr/lib/node_modules

# Entry point
ENTRYPOINT ["sh", "run-parity.sh"]

# Scripts
ADD .scripts/run-parity.sh .
ADD .scripts/transfer-ether.js /docker-scripts/transfer-ether.js
ADD .scripts/parity-block-scheduler.js /docker-scripts/parity-block-scheduler.js


# Ports
EXPOSE 8545 8180