FROM ubuntu:22.04
WORKDIR /geth-app
RUN apt-get update && apt-get install -y wget unzip
RUN wget "https://github.com/bnb-chain/bsc/releases/download/v1.6.5/geth_linux"
RUN mv geth_linux geth
RUN chmod -v u+x geth
RUN wget "https://github.com/bnb-chain/bsc/releases/download/v1.6.5/mainnet.zip"
RUN unzip mainnet.zip
RUN mv config.toml config-mainnet.toml
RUN mv genesis.json genesis-mainnet.json
RUN wget "https://github.com/bnb-chain/bsc/releases/download/v1.6.5/testnet.zip"
RUN unzip testnet.zip
RUN mv config.toml config-testnet.toml
RUN mv genesis.json genesis-testnet.json
RUN sed -ri '/(FileRoot|Level|MaxBytes|FilePath|Log)/s/^/#/g' config-mainnet.toml 
RUN sed -ri '/(FileRoot|Level|MaxBytes|FilePath|Log)/s/^/#/g' config-testnet.toml
RUN rm testnet.zip
RUN rm mainnet.zip
