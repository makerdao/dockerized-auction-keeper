# dockerized-auction-keeper

`dockerized-auction-keeper` contains a preconfigured [auction-keeper](https://github.com/makerdao/auction-keeper) that follows a simple FMV discount pricing model. With docker as the only prerequisite, this instance is well-suited for first-time auction keeper operators.

Note: Docker image will be created based on current master branch when you first run the keeper. If you want to rebuild image
with latest master make sure keepers are stopped then run `./cleanup.sh` script

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

After following the setup procedure below, this keeper works out of the box under the following configuration:
- Participates in up to 100 active ETH-A Flip auctions; it does not start new ones
- Begins scan at a prescribed auction id - we recommend starting at:
  - `mainnet` - 4500
  - `kovan` - 1800
- Looks for Vaults (i.e. `urns`) at a supplied block height - we recommend starting at the block that `Vat` was deployed:
  - `mainnet` - 8928152
  - `kovan 1.0.2` - 14764534
- Uses a pricing model that tracks the price of ETH via a public API and applies a `DISCOUNT` before participating
- All logs from the keeper are saved and appended to a single `auction-keeper-flip-ETH-A.log` file

- Create a a folder in the root directory of the repo called `secrets`
- Place unlocked keystore and password file for account address under `secrets` directory
- Configure following variables in `environment_flip.sh` file:
    - `SERVER_ETH_RPC_HOST`: URL to ETH Parity node  
    - `SERVER_ETH_RPC_PORT`: ETH RPC port  
    - `ETHGASSTATION_API_KEY`: eth gas station API KEY, can be applied for at https://data.concourseopen.com/
    - `FIRST_BLOCK_TO_CHECK`: Recommendation under introduction section
    - `FLIP_ACCOUNT_ADDRESS`: address to use for bidding
    - `FLIP_ETH_A_ACCOUNT_KEY`: account key format of `key_file=/opt/keeper/secrets/keystore.json,pass_file=/opt/keeper/secrets/password.txt`  
    Note: path to file should always be `/opt/keeper/secrets/` followed by the name of file you create under secrets directory  
    Ex: if you put `keystore-flip-a.json` and `password-flip-a.txt` under `secrets` directory then var should be configured as
    `FLIP_ETH_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-a.json,pass_file=/opt/keeper/secrets/password-flip-a.txt'`
    - `FLIP_DAI_IN_VAT`: Amount of Dai in Vat (Internal Dai Balance); important that this is higher than your largest estimated bid amount
    - `FLIP_MINIMUM_AUCTION_ID_TO_CHECK`: Recommendation under introduction section
    - `FLIP_ETH_DISCOUNT`: Discount from ETH's FMV, which will be used as the bid price
    - `FLIP_GASPRICE`: Fixed GWei price used in bid participation

### Setup flop keeper

- Create a a folder in the root directory of the repo called `secrets`
- Place unlocked keystore and password file for account address under `secrets` directory
- Configure following variables in `environment_flip.sh` file:
    - `SERVER_ETH_RPC_HOST`: URL to ETH Parity node  
    - `SERVER_ETH_RPC_PORT`: ETH RPC port  
    - `ETHGASSTATION_API_KEY`: eth gas station API KEY, can be applied for at https://data.concourseopen.com/
    - `FIRST_BLOCK_TO_CHECK`: Recommendation under introduction section
    - `FLOP_ACCOUNT_ADDRESS`: address to use for bidding
    - `FLOP_ACCOUNT_KEY`: account key format of `key_file=/opt/keeper/secrets/keystore.json,pass_file=/opt/keeper/secrets/password.txt`  
    Note: path to file should always be `/opt/keeper/secrets/` followed by the name of file you create under secrets directory  
    Ex: if you put `keystore-flop.json` and `password-flop.txt` under `secrets` directory then var should be configured as
    `FLOP_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flop.json,pass_file=/opt/keeper/secrets/password-flop.txt'`
    - `FLOP_DAI_IN_VAT`: Amount of Dai in Vat (Internal Dai Balance); important that this is higher than your largest estimated bid amount
    - `FLOP_MKR_DISCOUNT`: Discount from MKR's FMV, which will be used as the bid price
    - `FLOP_GASPRICE`: Fixed GWei price used in bid participation

### Run

flip-eth-a keeper
`docker-compose up flip-eth-a | tee -a -i auction-keeper-flip-ETH-A.log`

flop keeper
`docker-compose up flop | tee -a -i auction-keeper-flop.log`

### Optional additions

Other auction keepers can be added in `docker-compose.yml` e.g. for a BAT flipper
- add startup scripts `flip-bat.sh` and `model-bat.sh` files under `flip/bat` directory
- configure any new env vars used by startup scripts in `environment.sh` script (e.g. `ACCOUNT_FLIP_BAT_KEY`)
- add keeper in `docker-compose.yml`
```
  flip-bat:
    build: .
    image: makerdao/auction-keeper
    volumes:
      - $PWD/secrets:/opt/keeper/secrets
      - $PWD/flip/bat/flip-bat-a.sh:/opt/keeper/flip-bat.sh
      - $PWD/flip/bat/model-bat.sh:/opt/keeper/model-bat.sh
      - $PWD/environment.sh:/opt/keeper/environment.sh
    logging:
      driver: "json-file"
      options:
        max-size: "100m"
        max-file: "10"
    command: /opt/keeper/flip-bat-a.sh model-bat.sh
```
- start it as `docker-compose up flip-bat | tee -a -i auction-keeper-flip-BAT.log`

## License
See [COPYING](https://github.com/makerdao/dockerized-auction-keeper/blob/master/COPYING) file.

## Disclaimer
YOU (MEANING ANY INDIVIDUAL OR ENTITY ACCESSING, USING OR BOTH THE SOFTWARE INCLUDED IN THIS GITHUB REPOSITORY) EXPRESSLY UNDERSTAND AND AGREE THAT YOUR USE OF THE SOFTWARE IS AT YOUR SOLE RISK. THE SOFTWARE IN THIS GITHUB REPOSITORY IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. YOU RELEASE AUTHORS OR COPYRIGHT HOLDERS FROM ALL LIABILITY FOR YOU HAVING ACQUIRED OR NOT ACQUIRED CONTENT IN THIS GITHUB REPOSITORY. THE AUTHORS OR COPYRIGHT HOLDERS MAKE NO REPRESENTATIONS CONCERNING ANY CONTENT CONTAINED IN OR ACCESSED THROUGH THE SERVICE, AND THE AUTHORS OR COPYRIGHT HOLDERS WILL NOT BE RESPONSIBLE OR LIABLE FOR THE ACCURACY, COPYRIGHT COMPLIANCE, LEGALITY OR DECENCY OF MATERIAL CONTAINED IN OR ACCESSED THROUGH THIS GITHUB REPOSITORY.
