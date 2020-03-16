# dockerized-auction-keeper

`dockerized-auction-keeper` contains a preconfigured [auction-keeper](https://github.com/makerdao/auction-keeper) that follows a simple FMV discount pricing model. With docker as the only prerequisite, this instance is well-suited for first-time auction keeper operators.

After following the setup procedure below, this keeper works out of the box under the following configuration:
- Bites, kicks, and participates in ETH-A Flip auctions
- Begins scan at a prescribed auction id - we recommend starting at:
  - `mainnet` - 4500
  - `kovan` - 1800
- Looks for Vaults (i.e. `urns`) at a supplied block height - we recommend starting at the block that `Vat` was deployed:
  - `mainnet` - 8928152
  - `kovan 1.0.2` - 14764534
- Uses a priciing model that tracks the price of ETH via a public API and applies a `DISCOUNT` before participating in auctions

### Install Prerequisite

- **Install Docker Community Edition for your OS:**
```
https://docs.docker.com/install/
```
- **Install Docker Compose for your OS:**
```
https://docs.docker.com/compose/install/
```

### Setup flip-eth-a keeper

- place keystore and password file for account address under `secrets` directory
- configure following variables in `my_environment_flip.sh` file:
    - `SERVER_ETH_RPC_HOST`: URL to ETH Parity node  
    - `SERVER_ETH_RPC_PORT`: ETH RPC port  
    - `ACCOUNT_ADDRESS`: address to use for bidding
    - `ACCOUNT_KEY`: account key format of `key_file=/opt/keeper/secrets/keystore.json,pass_file=/opt/keeper/secrets/password.txt`  
    Note: path to file should always be `/opt/keeper/secrets/` followed by the name of file you create under secrets directory  
    Ex: if you put `keystore-flip-a.json` and `password-flip-a.txt` under `secrets` directory then var should be configured as
    `ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-a.json,pass_file=/opt/keeper/secrets/password-flip-a.txt'`
    - `FIRST_BLOCK_TO_CHECK`: Recommendation under introduction section
    - `MINIMUM_AUCTION_ID_TO_CHECK`: Recommendation under introduction section
    - `DISCOUNT`: Discount from ETH's FMV, which will be used as the bid price
    - `GASPRICE`: Fixed GWei price used in bid participation

### Run

`docker-compose up flip-eth-a`

### Optional additions

Other auction keepers can be added in `docker-compose.yml` e.g. for a BAT flipper
- add startup scripts `flip-bat.sh` and `model-bat.sh` files
- add keeper in `docker-compose.yml`
```
  flip-bat:
    build: .
    image: makerdao/auction-keeper
    volumes:
      - $PWD/secrets:/opt/keeper/secrets
      - $PWD/flip-bat-a.sh:/opt/keeper/flip-bat.sh
      - $PWD/model-bat.sh:/opt/keeper/model-bat.sh
      - $PWD/my_environment_flip.sh:/opt/keeper/my_environment_flip.sh
    command: /opt/keeper/flip-bat-a.sh
```
- start it as `docker-compose up flip-bat`
