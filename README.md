# dockerized-auction-keeper

### Install

- **Install Docker Community Edition for your OS:**
```
https://docs.docker.com/install/
```
- **Install Docker Compose for your OS:**
```
https://docs.docker.com/compose/install/
```

### Configure flip-eth-a keeper

- place keystore and password file for account under secrets directory
- configure following variables in `my_environment_flip.sh` file:
    - `SERVER_ETH_RPC_HOST`: URL to ETH node  
    - `SERVER_ETH_RPC_PORT`: ETH RPC port  
    - `ACCOUNT_ADDRESS`: address to use for bidding
    - `ACCOUNT_KEY`: account key format of `key_file=/opt/keeper/secrets/keystore.json,pass_file=/opt/keeper/secrets/password.txt`  
    Note: path to file should always be `/opt/keeper/secrets/` followed by the name of file you create under secrets directory  
    Ex: if you put `keystore-flip-a.json` and `password-flip-a.txt` under `secrets` directory then var should be configured as
    `ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-a.json,pass_file=/opt/keeper/secrets/password-flip-a.txt'`

### Run

`docker-compose up flip-eth-a`

Other auction keepers can be added in `docker-compose.yml` e.g. for a BAT flipper
- add startup scripts `flip-bat.sh` and `model-bat.sh` files
- add keeper in `docker-compose.yml`
```
  flip-bat:
    build: .
    image: makerdao/auction-keeper
    volumes:
      - $PWD/secrets:/opt/keeper/secrets
      - $PWD/flip-eth-a.sh:/opt/keeper/flip-bat.sh
      - $PWD/model-eth.sh:/opt/keeper/model-bat.sh
      - $PWD/my_environment_flip.sh:/opt/keeper/my_environment_flip.sh
    command: /opt/keeper/flip-eth-a.sh
```
- start it as `docker-compose up flip-bat`


