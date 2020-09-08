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

### Setup flip keepers

After following the setup procedure below, this keeper works out of the box under the following configuration:
- Participates in up to 100 active ETH-A or BAT-A or USDC-A or USDC-B or WBTC-A or TUSD-A or KNC-A or ZRX-A or MANA-A or USDT-A Flip auctions; it does not start new ones
- Begins scan at a prescribed auction id - we recommend starting at:
  - `mainnet` - 0 for all collateral types
  - `kovan` - 0 for all collateral types
- Looks for Vaults (i.e. `urns`) at a supplied block height - we recommend starting at the block that `Vat` was deployed:
  - `mainnet` - 8928152
  - `kovan 1.0.2` - 14764534
- Uses a pricing model that tracks the price of ETH | BAT | USDC | WBTC | TUSD | KNC | ZRX | MANA | USDT via a public API and applies a `DISCOUNT` before participating
- All logs from the keeper are saved and appended to a single file (`auction-keeper-flip-ETH-A.log` or `auction-keeper-flip-BAT-A.log` or `auction-keeper-flip-USDC-A.log` or `auction-keeper-flip-USDC-B.log` or `auction-keeper-flip-WBTC-A.log`  or `auction-keeper-flip-TUSD-A.log` or `auction-keeper-flip-KNC-A.log` or `auction-keeper-flip-ZRX-A.log` or `auction-keeper-flip-MANA-A.log` or `auction-keeper-flip-USDT-A.log`)
- Place unlocked keystore and password file for account address under `secrets` directory. The names of the keystore and password files will need to be updated in the `FLIP_ETH_A_ACCOUNT_KEY` | `FLIP_BAT_A_ACCOUNT_KEY` | `FLIP_USDC_A_ACCOUNT_KEY` | `FLIP_USDC_B_ACCOUNT_KEY` | `FLIP_WBTC_A_ACCOUNT_KEY` | `FLIP_TUSD_A_ACCOUNT_KEY` | `FLIP_KNC_A_ACCOUNT_KEY` | `FLIP_ZRX_A_ACCOUNT_KEY` | `FLIP_MANA_A_ACCOUNT_KEY` | `FLIP_USDT_A_ACCOUNT_KEY` in the env.
- Configure following variables in `env/environment.sh` file:
    - `SERVER_ETH_RPC_HOST`: URL to ETH Parity node (containing port if case) e.g. http://localhost:8545
    - `ETHGASSTATION_API_KEY`: eth gas station API KEY, can be applied for at https://data.concourseopen.com/
    - `GASPRICE_MULTIPLIER`: dynamic gas multiplier (e.g. if 2.0 then will use 2 * base)
    - `FIRST_BLOCK_TO_CHECK`: Recommendation under introduction section
    - `FLIP_ETH_A_ACCOUNT_ADDRESS` | `FLIP_BAT_A_ACCOUNT_ADDRESS` | `FLIP_USDC_A_ACCOUNT_ADDRESS` | `FLIP_USDC_B_ACCOUNT_ADDRESS` | `FLIP_WBTC_A_ACCOUNT_ADDRESS` | `FLIP_TUSD_A_ACCOUNT_ADDRESS` | `FLIP_KNC_A_ACCOUNT_ADDRESS` | `FLIP_ZRX_A_ACCOUNT_ADDRESS` | `FLIP_MANA_A_ACCOUNT_ADDRESS` | `FLIP_USDT_A_ACCOUNT_ADDRESS`: address to use for bidding
    - `FLIP_ETH_A_ACCOUNT_KEY` | `FLIP_BAT_A_ACCOUNT_KEY` | `FLIP_USDC_A_ACCOUNT_KEY` | `FLIP_USDC_B_ACCOUNT_KEY` | `FLIP_WBTC_A_ACCOUNT_KEY` | `FLIP_TUSD_A_ACCOUNT_KEY` | `FLIP_KNC_A_ACCOUNT_KEY` | `FLIP_ZRX_A_ACCOUNT_KEY` | `FLIP_MANA_A_ACCOUNT_KEY` | `FLIP_USDT_A_ACCOUNT_KEY`: account key format of `key_file=/opt/keeper/secrets/keystore.json,pass_file=/opt/keeper/secrets/password.txt`
    Note: path to file should always be `/opt/keeper/secrets/` followed by the name of file you create under secrets directory
    Ex: if you put `keystore-flip-a.json` and `password-flip-a.txt` under `secrets` directory then var should be configured as
    `FLIP_ETH_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-eth-a.json,pass_file=/opt/keeper/secrets/password-flip-eth-a.txt'`
    or
    `FLIP_BAT_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-bat-a.json,pass_file=/opt/keeper/secrets/password-flip-bat-a.txt'`
    or
    `FLIP_USDC_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-usdc-a.json,pass_file=/opt/keeper/secrets/password-flip-usdc-a.txt'`
    or
    `FLIP_USDC_B_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-usdc-b.json,pass_file=/opt/keeper/secrets/password-flip-usdc-b.txt'`
    or
    `FLIP_WBTC_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-wbtc-a.json,pass_file=/opt/keeper/secrets/password-flip-wbtc-a.txt'`
    or
    `FLIP_TUSD_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-tusd-a.json,pass_file=/opt/keeper/secrets/password-flip-tusd-a.txt'`
    or
    `FLIP_KNC_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-knc-a.json,pass_file=/opt/keeper/secrets/password-flip-knc-a.txt'`
    or
    `FLIP_ZRX_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-zrx-a.json,pass_file=/opt/keeper/secrets/password-flip-zrx-a.txt'`
    or
    `FLIP_MANA_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-mana-a.json,pass_file=/opt/keeper/secrets/password-flip-mana-a.txt'`
    or
    `FLIP_USDT_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-usdt-a.json,pass_file=/opt/keeper/secrets/password-flip-usdt-a.txt'`
    - `FLIP_DAI_IN_VAT`: Amount of Dai in Vat (Internal Dai Balance); important that this is higher than your largest estimated bid amount
    - `FLIP_ETH_A_DAI_IN_VAT` | `FLIP_BAT_A_DAI_IN_VAT` | `FLIP_USDC_A_DAI_IN_VAT` | `FLIP_USDC_B_DAI_IN_VAT` | `FLIP_WBTC_A_DAI_IN_VAT` | `FLIP_TUSD_A_DAI_IN_VAT` | `FLIP_KNC_A_DAI_IN_VAT` | `FLIP_ZRX_A_DAI_IN_VAT` | `FLIP_MANA_A_DAI_IN_VAT` | `FLIP_USDT_A_DAI_IN_VAT`: Amount of Dai in Vat per collateral type
    - `FLIP_MINIMUM_ETH_A_AUCTION_ID_TO_CHECK` | `FLIP_MINIMUM_BAT_A_AUCTION_ID_TO_CHECK` | `FLIP_MINIMUM_USDC_A_AUCTION_ID_TO_CHECK` | `FLIP_MINIMUM_USDC_B_AUCTION_ID_TO_CHECK` | `FLIP_MINIMUM_WBTC_A_AUCTION_ID_TO_CHECK` | `FLIP_MINIMUM_TUSD_A_AUCTION_ID_TO_CHECK` | `FLIP_MINIMUM_KNC_A_AUCTION_ID_TO_CHECK` | `FLIP_MINIMUM_ZRX_A_AUCTION_ID_TO_CHECK` | `FLIP_MINIMUM_MANA_A_AUCTION_ID_TO_CHECK` | `FLIP_MINIMUM_USDT_A_AUCTION_ID_TO_CHECK`: Recommendation under introduction section
    - `FLIP_ETH_A_DISCOUNT` | `FLIP_BAT_A_DISCOUNT` | `FLIP_USDC_A_DISCOUNT` | `FLIP_USDC_A_DISCOUNT` | `FLIP_WBTC_A_DISCOUNT` | `FLIP_TUSD_A_DISCOUNT` | `FLIP_KNC_A_DISCOUNT` | `FLIP_ZRX_A_DISCOUNT` | `FLIP_MANA_A_DISCOUNT` | `FLIP_USDT_A_DISCOUNT`: Discount from ETH's or BAT's or USDC's FMV or WBTC's FMV, which will be used as the bid price

### Setup flop keeper

- Place unlocked keystore and password file for account address under `secrets` directory. The names of the keystore and password files will need to be updated in the `FLOP_ACCOUNT_KEY` in the env.
- Configure following variables in `env/environment.sh` file:
    - `SERVER_ETH_RPC_HOST`: URL to ETH Parity node (containing port if case) e.g. http://localhost:8545
    - `ETHGASSTATION_API_KEY`: eth gas station API KEY, can be applied for at https://data.concourseopen.com/
    - `GASPRICE_MULTIPLIER`: dynamic gas multiplier (e.g. if 2.0 then will use 2 * base)
    - `FIRST_BLOCK_TO_CHECK`: Recommendation under introduction section
    - `FLOP_ACCOUNT_ADDRESS`: address to use for bidding
    - `FLOP_ACCOUNT_KEY`: account key format of `key_file=/opt/keeper/secrets/keystore.json,pass_file=/opt/keeper/secrets/password.txt`
    Note: path to file should always be `/opt/keeper/secrets/` followed by the name of file you create under secrets directory
    Ex: if you put `keystore-flop.json` and `password-flop.txt` under `secrets` directory then var should be configured as
    `FLOP_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flop.json,pass_file=/opt/keeper/secrets/password-flop.txt'`
    - `FLOP_DAI_IN_VAT`: Amount of Dai in Vat (Internal Dai Balance); important that this is higher than your largest estimated bid amount
    - `FLOP_MKR_DISCOUNT`: Discount from MKR's FMV, which will be used as the bid price

### Run

flip-eth-a keeper
`./start-keeper.sh flip-eth-a | tee -a -i auction-keeper-flip-ETH-A.log`

flip-bat-a keeper
`./start-keeper.sh flip-bat-a | tee -a -i auction-keeper-flip-BAT-A.log`

flip-usdc-a keeper
`./start-keeper.sh flip-usdc-a | tee -a -i auction-keeper-flip-USDC-A.log`

flip-usdc-b keeper
`./start-keeper.sh flip-usdc-b | tee -a -i auction-keeper-flip-USDC-B.log`

flip-wbtc-a keeper
`./start-keeper.sh flip-wbtc-a | tee -a -i auction-keeper-flip-WBTC-A.log`

flip-tusd-a keeper
`./start-keeper.sh flip-tusd-a | tee -a -i auction-keeper-flip-TUSD-A.log`

flip-knc-a keeper
`./start-keeper.sh flip-knc-a | tee -a -i auction-keeper-flip-KNC-A.log`

flip-zrx-a keeper
`./start-keeper.sh flip-zrx-a | tee -a -i auction-keeper-flip-ZRX-A.log`

flip-mana-a keeper
`./start-keeper.sh flip-mana-a | tee -a -i auction-keeper-flip-MANA-A.log`

flip-usdt-a keeper
`./start-keeper.sh flip-usdt-a | tee -a -i auction-keeper-flip-USDT-A.log`

flop keeper
`./start-keeper.sh flop | tee -a -i auction-keeper-flop.log`

### Shutdown
This will gracefully stop keeper and will exit DAI / collateral from Vat contract to keeper operating address.
The shutdown command should be issued from the same directory as the run command but in another console instance.

flip-eth-a keeper
`./stop-keeper.sh flip-eth-a`

flip-bat-a keeper
`./stop-keeper.sh flip-bat-a`

flip-usdc-a keeper
`./stop-keeper.sh flip-usdc-a`

flip-wbtc-a keeper
`./stop-keeper.sh flip-wbtc-a`

flip-tusd-a keeper
`./stop-keeper.sh flip-tusd-a`

flip-knc-a keeper
`./stop-keeper.sh flip-knc-a`

flip-zrx-a keeper
`./stop-keeper.sh flip-zrx-a`

flip-mana-a keeper
`./stop-keeper.sh flip-mana-a`

flip-usdt-a keeper
`./stop-keeper.sh flip-usdt-a`

flop keeper
`./stop-keeper.sh flop`

### Using a dynamic gas price model for bids

- configure following variables in `env/environment.sh` file:
```
# Dynamic Gas Price Model
# 0 = get the gas price from the node (default)
# 1 = get the gas price from ethgasstation.info
#     must set ETHGASSTATION_API_KEY
# 2 = get the gas price from etherchain.org
# 3 = get the gas price from poanetwork
#     set POANETWORK_URL env var to point to a self hosted server e.g. POANETWORK_URL=http://localhost:8000
GAS_MODE=0
# increase this if you want to use higher price than the one reported
# (e.g. if 2.0 then will use 2 * fastest)
GASPRICE_MULTIPLIER=1.4
# ETHGASSTATION_API_KEY is optional.  If you fill it in the model will use
# ethgasstation.info for dynamic gas, otherwise we will simply check the node.
ETHGASSTATION_API_KEY=MY_ETH_GASSTATION_KEY
```  
Note: this configuration determines keeper gas price strategy as explained in https://github.com/makerdao/auction-keeper#gas-price-strategy 

### Optional additions

Other auction keepers can be added in `docker-compose.yml` e.g. for a flapper keeper

### Note on using Windows Subsystem for Linux
As Docker Desktop is not able to access the filesystem of WSL, you need to copy `dockerized-aution-keeper` somewhere in the `/c/` path and run it from there. e.g. `/c/Users/username/dev/dockerized-auction-keeper` instead of `/home/username/dev/dockerized-auction-keeper`. 

Running `./start-keeper.sh flip-eth-a` from a WSL path will generate this error:
```
ERROR: for flip-eth-a  Cannot start service flip-eth-a: OCI runtime create failed: container_linux.go:346: starting container process caused "exec: \"./flip-eth-a.sh\": stat ./flip-eth-a.sh: no such file or directory": unknown
```

## License
See [COPYING](https://github.com/makerdao/dockerized-auction-keeper/blob/master/COPYING) file.

## Disclaimer
YOU (MEANING ANY INDIVIDUAL OR ENTITY ACCESSING, USING OR BOTH THE SOFTWARE INCLUDED IN THIS GITHUB REPOSITORY) EXPRESSLY UNDERSTAND AND AGREE THAT YOUR USE OF THE SOFTWARE IS AT YOUR SOLE RISK. THE SOFTWARE IN THIS GITHUB REPOSITORY IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. YOU RELEASE AUTHORS OR COPYRIGHT HOLDERS FROM ALL LIABILITY FOR YOU HAVING ACQUIRED OR NOT ACQUIRED CONTENT IN THIS GITHUB REPOSITORY. THE AUTHORS OR COPYRIGHT HOLDERS MAKE NO REPRESENTATIONS CONCERNING ANY CONTENT CONTAINED IN OR ACCESSED THROUGH THE SERVICE, AND THE AUTHORS OR COPYRIGHT HOLDERS WILL NOT BE RESPONSIBLE OR LIABLE FOR THE ACCURACY, COPYRIGHT COMPLIANCE, LEGALITY OR DECENCY OF MATERIAL CONTAINED IN OR ACCESSED THROUGH THIS GITHUB REPOSITORY.
