FROM ubuntu:22.04
WORKDIR /geth-app
RUN apt-get update && apt-get install -y wget unzip
RUN wget "https://github.com/bnb-chain/bsc/releases/download/v1.7.2/geth_linux"
RUN mv geth_linux geth
RUN chmod -v u+x geth
RUN wget "https://github.com/bnb-chain/bsc/releases/download/v1.7.2/mainnet.zip"
RUN unzip mainnet.zip
RUN mv mainnet/config.toml config-mainnet.toml
RUN mv mainnet/genesis.json genesis-mainnet.json
RUN wget "https://github.com/bnb-chain/bsc/releases/download/v1.7.2/testnet.zip"
RUN unzip testnet.zip
RUN mv testnet/config.toml config-testnet.toml
RUN mv testnet/genesis.json genesis-testnet.json
RUN sed -ri '/(FileRoot|Level|MaxBytes|FilePath|Log)/s/^/#/g' config-mainnet.toml 
RUN sed -ri '/(FileRoot|Level|MaxBytes|FilePath|Log)/s/^/#/g' config-testnet.toml
RUN rm testnet.zip
RUN rm mainnet.zip
