FROM python:3.6.6

RUN groupadd -r keeper && useradd --no-log-init -r -g keeper keeper && \
    apt-get -y update && \
    apt-get -y install jq bc


WORKDIR /opt/keeper
RUN git clone https://github.com/makerdao/auction-keeper.git && \
    cd auction-keeper && \
    git submodule update --init --recursive && \
    pip3 install virtualenv && \
    ./install.sh

WORKDIR /opt/keeper

USER keeper