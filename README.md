# Attention

## This Repo in no longer active, please visit https://github.com/makerdao/auction-demo-keeper to run a keeper!!

please see this issue https://github.com/makerdao/dockerized-auction-keeper/issues/47 or visit https://discord.com/channels/893112320329396265/899667556418351194/988679692938805249

# dockerized-auction-keeper

`dockerized-auction-keeper` contains a preconfigured [auction-keeper](https://github.com/makerdao/auction-keeper) that follows a simple FMV discount pricing model. With docker as the only prerequisite, this instance is well-suited for first-time auction keeper operators.

**Note**: Docker image will be created based on current master branch when you first run the keeper. If you want to rebuild image
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
- Participates in up to 100 active ETH-A or ETH-B or BAT-A or USDC-A or USDC-B or WBTC-A or TUSD-A or KNC-A or ZRX-A or MANA-A or USDT-A or PAXUSD-A or COMP-A or LINK-A or LRC-A Flip auctions; it does not start new ones
- Begins scan at a prescribed auction id - we recommend starting at:
  - `mainnet` - 0 for all collateral types
  - `kovan` - 0 for all collateral types
- Looks for Vaults (i.e. `urns`) at a supplied block height - we recommend starting at the block that `Vat` was deployed:
  - `mainnet` - 8928152
  - `kovan 1.0.2` - 14764534
- Uses a pricing model that tracks the price of the following assets via a public API and applies a `DISCOUNT` before participating:
    - ETH
    - BAT
    - USDC
    - WBTC
    - TUSD
    - KNC
    - ZRX
    - MANA
    - USDT
    - PAXUSD
    - COMP
    - LINK
    - LRC
    - BAL
    - YFI
    - GUSD
    - RENBTC
    - UNI
    - AAVE
    - UNIV2DAIETH
- All logs from the keeper are saved and appended to a single file:
    - `auction-keeper-flip-ETH-A.log`
    - `auction-keeper-flip-ETH-B.log`
    - `auction-keeper-flip-BAT-A.log`
    - `auction-keeper-flip-USDC-A.log`
    - `auction-keeper-flip-USDC-B.log`
    - `auction-keeper-flip-WBTC-A.log`
    - `auction-keeper-flip-TUSD-A.log`
    - `auction-keeper-flip-KNC-A.log`
    - `auction-keeper-flip-ZRX-A.log`
    - `auction-keeper-flip-MANA-A.log`
    - `auction-keeper-flip-USDT-A.log`
    - `auction-keeper-flip-PAXUSD-A.log`
    - `auction-keeper-flip-COMP-A.log`
    - `auction-keeper-flip-LINK-A.log`
    - `auction-keeper-flip-LRC-A.log`
    - `auction-keeper-flip-BAL-A.log`
    - `auction-keeper-flip-YFI-A.log`
    - `auction-keeper-flip-GUSD-A.log`
    - `auction-keeper-flip-RENBTC-A.log`
    - `auction-keeper-flip-UNI-A.log`
    - `auction-keeper-flip-AAVE-A.log`
    - `auction-keeper-flip-UNIV2DAIETH-A.log`
- Place unlocked keystore and password file for account address under `secrets` directory. The names of the keystore and password files will need to be updated in the environment:
    - `FLIP_ETH_A_ACCOUNT_KEY`
    - `FLIP_ETH_B_ACCOUNT_KEY`
    - `FLIP_BAT_A_ACCOUNT_KEY`
    - `FLIP_USDC_A_ACCOUNT_KEY`
    - `FLIP_USDC_B_ACCOUNT_KEY`
    - `FLIP_WBTC_A_ACCOUNT_KEY`
    - `FLIP_TUSD_A_ACCOUNT_KEY`
    - `FLIP_KNC_A_ACCOUNT_KEY`
    - `FLIP_ZRX_A_ACCOUNT_KEY`
    - `FLIP_MANA_A_ACCOUNT_KEY`
    - `FLIP_USDT_A_ACCOUNT_KEY`
    - `FLIP_PAXUSD_A_ACCOUNT_KEY`
    - `FLIP_COMP_A_ACCOUNT_KEY`
    - `FLIP_LINK_A_ACCOUNT_KEY`
    - `FLIP_LRC_A_ACCOUNT_KEY`
    - `FLIP_BAL_A_ACCOUNT_KEY`
    - `FLIP_YFI_A_ACCOUNT_KEY`
    - `FLIP_GUSD_A_ACCOUNT_KEY`
    - `FLIP_RENBTC_A_ACCOUNT_KEY`
    - `FLIP_UNI_A_ACCOUNT_KEY`
    - `FLIP_AAVE_A_ACCOUNT_KEY`
    - `FLIP_UNIV2DAIETH_A_ACCOUNT_KEY`
- Configure following variables in `env/environment.sh` file:
    - `SERVER_ETH_RPC_HOST`: URL to ETH Parity node (containing port if case) e.g. http://localhost:8545
    - `ETHGASSTATION_API_KEY`: eth gas station API KEY, can be applied for at https://data.concourseopen.com/
    - `ETHERSCAN_API_KEY`: etherscan API KEY, can be applied for at https://etherscan.io/myapikey
    - `GASPRICE_MULTIPLIER`: dynamic gas multiplier (e.g. if 2.0 then will use 2 * base)
    - `FIRST_BLOCK_TO_CHECK`: Recommendation under introduction section
        - `FLIP_DAI_IN_VAT`: Amount of Dai in Vat (Internal Dai Balance); important that this is higher than your largest estimated bid amount
    - Amount of Dai in Vat per collateral type:
        - `FLIP_ETH_A_DAI_IN_VAT`
        - `FLIP_ETH_B_DAI_IN_VAT`
        - `FLIP_BAT_A_DAI_IN_VAT`
        - `FLIP_USDC_A_DAI_IN_VAT`
        - `FLIP_USDC_B_DAI_IN_VAT`
        - `FLIP_WBTC_A_DAI_IN_VAT`
        - `FLIP_TUSD_A_DAI_IN_VAT`
        - `FLIP_KNC_A_DAI_IN_VAT`
        - `FLIP_ZRX_A_DAI_IN_VAT`
        - `FLIP_MANA_A_DAI_IN_VAT`
        - `FLIP_USDT_A_DAI_IN_VAT`
        - `FLIP_PAXUSD_A_DAI_IN_VAT`
        - `FLIP_COMP_A_DAI_IN_VAT`
        - `FLIP_LINK_A_DAI_IN_VAT`
        - `FLIP_LRC_A_DAI_IN_VAT`
        - `FLIP_BAL_A_DAI_IN_VAT`
        - `FLIP_YFI_A_DAI_IN_VAT`
        - `FLIP_GUSD_A_DAI_IN_VAT`
        - `FLIP_RENBTC_A_DAI_IN_VAT`
        - `FLIP_UNI_A_DAI_IN_VAT`
        - `FLIP_AAVE_A_DAI_IN_VAT`
        - `FLIP_UNIV2DAIETH_A_DAI_IN_VAT`
    - Minimum auction id to check as recommendation under introduction section:
        - `FLIP_MINIMUM_ETH_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_ETH_B_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_BAT_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_USDC_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_USDC_B_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_WBTC_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_TUSD_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_KNC_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_ZRX_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_MANA_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_USDT_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_PAXUSD_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_COMP_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_LINK_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_LRC_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_BAL_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_YFI_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_GUSD_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_RENBTC_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_UNI_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_AAVE_A_AUCTION_ID_TO_CHECK`
        - `FLIP_MINIMUM_UNIV2DAIETH_A_AUCTION_ID_TO_CHECK`
    - Discount from asset's fair market value (FMV), which will be used as the bid price:
        - `FLIP_ETH_A_DISCOUNT`
        - `FLIP_ETH_B_DISCOUNT`
        - `FLIP_BAT_A_DISCOUNT`
        - `FLIP_USDC_A_DISCOUNT`
        - `FLIP_USDC_B_DISCOUNT`
        - `FLIP_WBTC_A_DISCOUNT`
        - `FLIP_TUSD_A_DISCOUNT`
        - `FLIP_KNC_A_DISCOUNT`
        - `FLIP_ZRX_A_DISCOUNT`
        - `FLIP_MANA_A_DISCOUNT`
        - `FLIP_USDT_A_DISCOUNT`
        - `FLIP_PAXUSD_A_DISCOUNT`
        - `FLIP_COMP_A_DISCOUNT`
        - `FLIP_LINK_A_DISCOUNT`
        - `FLIP_LRC_A_DISCOUNT`
        - `FLIP_BAL_A_DISCOUNT`
        - `FLIP_YFI_A_DISCOUNT`
        - `FLIP_GUSD_A_DISCOUNT`
        - `FLIP_RENBTC_A_DISCOUNT`
        - `FLIP_UNI_A_DISCOUNT`
        - `FLIP_AAVE_A_DISCOUNT`
        - `FLIP_UNIV2DAIETH_A_DISCOUNT`
    - Account address to use for bidding:
        - `FLIP_ETH_A_ACCOUNT_ADDRESS`
        - `FLIP_ETH_B_ACCOUNT_ADDRESS`
        - `FLIP_BAT_A_ACCOUNT_ADDRESS`
        - `FLIP_USDC_A_ACCOUNT_ADDRESS`
        - `FLIP_USDC_B_ACCOUNT_ADDRESS`
        - `FLIP_WBTC_A_ACCOUNT_ADDRESS`
        - `FLIP_TUSD_A_ACCOUNT_ADDRESS`
        - `FLIP_KNC_A_ACCOUNT_ADDRESS`
        - `FLIP_ZRX_A_ACCOUNT_ADDRESS`
        - `FLIP_MANA_A_ACCOUNT_ADDRESS`
        - `FLIP_USDT_A_ACCOUNT_ADDRESS`
        - `FLIP_PAXUSD_A_ACCOUNT_ADDRESS`
        - `FLIP_COMP_A_ACCOUNT_ADDRESS`
        - `FLIP_LINK_A_ACCOUNT_ADDRESS`
        - `FLIP_LRC_A_ACCOUNT_ADDRESS`
        - `FLIP_BAL_A_ACCOUNT_ADDRESS`
        - `FLIP_YFI_A_ACCOUNT_ADDRESS`
        - `FLIP_GUSD_A_ACCOUNT_ADDRESS`
        - `FLIP_RENBTC_A_ACCOUNT_ADDRESS`
        - `FLIP_UNI_A_ACCOUNT_ADDRESS`
        - `FLIP_AAVE_A_ACCOUNT_ADDRESS`
        - `FLIP_UNIV2DAIETH_A_ACCOUNT_ADDRESS`
    - Account key format of: `key_file=/opt/keeper/secrets/keystore.json,pass_file=/opt/keeper/secrets/password.txt`
        - `FLIP_ETH_A_ACCOUNT_KEY`
        - `FLIP_ETH_B_ACCOUNT_KEY`
        - `FLIP_BAT_A_ACCOUNT_KEY`
        - `FLIP_USDC_A_ACCOUNT_KEY`
        - `FLIP_USDC_B_ACCOUNT_KEY`
        - `FLIP_WBTC_A_ACCOUNT_KEY`
        - `FLIP_TUSD_A_ACCOUNT_KEY`
        - `FLIP_KNC_A_ACCOUNT_KEY`
        - `FLIP_ZRX_A_ACCOUNT_KEY`
        - `FLIP_MANA_A_ACCOUNT_KEY`
        - `FLIP_USDT_A_ACCOUNT_KEY`
        - `FLIP_PAXUSD_A_ACCOUNT_KEY`
        - `FLIP_COMP_A_ACCOUNT_KEY`
        - `FLIP_LINK_A_ACCOUNT_KEY`
        - `FLIP_LRC_A_ACCOUNT_KEY`
        - `FLIP_BAL_A_ACCOUNT_KEY`
        - `FLIP_YFI_A_ACCOUNT_KEY`
        - `FLIP_GUSD_A_ACCOUNT_KEY`
        - `FLIP_RENBTC_A_ACCOUNT_KEY`
        - `FLIP_UNI_A_ACCOUNT_KEY`
        - `FLIP_AAVE_A_ACCOUNT_KEY`
        - `FLIP_UNIV2DAIETH_A_ACCOUNT_KEY`

    **Note**: Path to file should always be `/opt/keeper/secrets/` followed by the name of file you create under secrets directory.
    Ex: if you put `keystore-flip-a.json` and `password-flip-a.txt` under `secrets` directory then var should be configured as:
    `FLIP_ETH_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-eth-a.json,pass_file=/opt/keeper/secrets/password-flip-eth-a.txt'`
    or
    `FLIP_ETH_B_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-eth-b.json,pass_file=/opt/keeper/secrets/password-flip-eth-b.txt'`
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
    or
    `FLIP_PAXUSD_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-paxusd-a.json,pass_file=/opt/keeper/secrets/password-flip-paxusd-a.txt'`
    or
    `FLIP_COMP_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-comp-a.json,pass_file=/opt/keeper/secrets/password-flip-comp-a.txt'`
    or
    `FLIP_LINK_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-link-a.json,pass_file=/opt/keeper/secrets/password-flip-link-a.txt'`
    or
    `FLIP_LRC_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-lrc-a.json,pass_file=/opt/keeper/secrets/password-flip-lrc-a.txt'`
    or
    `FLIP_BAL_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-bal-a.json,pass_file=/opt/keeper/secrets/password-flip-bal-a.txt'`
    or
    `FLIP_YFI_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-yfi-a.json,pass_file=/opt/keeper/secrets/password-flip-yfi-a.txt'`
    or
    `FLIP_GUSD_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-gusd-a.json,pass_file=/opt/keeper/secrets/password-flip-gusd-a.txt'`
    or
    `FLIP_RENBTC_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-renbtc-a.json,pass_file=/opt/keeper/secrets/password-flip-renbtc-a.txt'`
    or
    `FLIP_UNI_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-uni-a.json,pass_file=/opt/keeper/secrets/password-flip-uni-a.txt'`
    or
    `FLIP_AAVE_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-aave-a.json,pass_file=/opt/keeper/secrets/password-flip-aave-a.txt'`
    or
    `FLIP_UNIV2DAIETH_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-univ2daieth-a.json,pass_file=/opt/keeper/secrets/password-flip-univ2daieth-a.txt'`

    **Note**: for better security you should avoid distributing password file to the machine and instead specify only keystore in key variable, e.g. `FLIP_ETH_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-eth-a.json'` and use `./start-interactive-keeper.sh`. You wil be asked to input password on keeper startup.


### Setup flap keeper

- Place unlocked keystore and password file for account address under `secrets` directory. The names of the keystore and password files will need to be updated in the `FLAP_ACCOUNT_KEY` in the env.
- Configure following variables in `env/environment.sh` file:
    - `SERVER_ETH_RPC_HOST`: URL to ETH Parity node (containing port if case) e.g. http://localhost:8545
    - `ETHGASSTATION_API_KEY`: eth gas station API KEY, can be applied for at https://data.concourseopen.com/
    - `ETHERSCAN_API_KEY`: etherscan API KEY, can be applied for at https://etherscan.io/myapikey
    - `GASPRICE_MULTIPLIER`: dynamic gas multiplier (e.g. if 2.0 then will use 2 * base)
    - `FLAP_ACCOUNT_ADDRESS`: address to use for bidding
    - `FLAP_ACCOUNT_KEY`: account key format of `key_file=/opt/keeper/secrets/keystore.json,pass_file=/opt/keeper/secrets/password.txt`

    **Note**: path to file should always be `/opt/keeper/secrets/` followed by the name of file you create under secrets directory
    Ex: if you put `keystore-flap.json` and `password-flap.txt` under `secrets` directory then var should be configured as
    `FLAP_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flap.json,pass_file=/opt/keeper/secrets/password-flap.txt'`
    - `FLAP_DAI_IN_VAT`: Amount of Dai in Vat (Internal Dai Balance); important that this is higher than your largest estimated bid amount
    - `FLAP_MKR_DISCOUNT`: Discount from MKR's FMV, which will be used as the bid price

### Setup flop keeper

- Place unlocked keystore and password file for account address under `secrets` directory. The names of the keystore and password files will need to be updated in the `FLOP_ACCOUNT_KEY` in the env.
- Configure following variables in `env/environment.sh` file:
    - `SERVER_ETH_RPC_HOST`: URL to ETH Parity node (containing port if case) e.g. http://localhost:8545
    - `ETHGASSTATION_API_KEY`: eth gas station API KEY, can be applied for at https://data.concourseopen.com/
    - `ETHERSCAN_API_KEY`: etherscan API KEY, can be applied for at https://etherscan.io/myapikey
    - `GASPRICE_MULTIPLIER`: dynamic gas multiplier (e.g. if 2.0 then will use 2 * base)
    - `FIRST_BLOCK_TO_CHECK`: Recommendation under introduction section
    - `FLOP_ACCOUNT_ADDRESS`: address to use for bidding
    - `FLOP_ACCOUNT_KEY`: account key format of `key_file=/opt/keeper/secrets/keystore.json,pass_file=/opt/keeper/secrets/password.txt`

    **Note**: path to file should always be `/opt/keeper/secrets/` followed by the name of file you create under secrets directory
    Ex: if you put `keystore-flop.json` and `password-flop.txt` under `secrets` directory then var should be configured as
    `FLOP_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flop.json,pass_file=/opt/keeper/secrets/password-flop.txt'`
    - `FLOP_DAI_IN_VAT`: Amount of Dai in Vat (Internal Dai Balance); important that this is higher than your largest estimated bid amount
    - `FLOP_MKR_DISCOUNT`: Discount from MKR's FMV, which will be used as the bid price

### Run

flip-eth-a keeper
`./start-keeper.sh flip-eth-a | tee -a -i auction-keeper-flip-ETH-A.log`

flip-eth-b keeper
`./start-keeper.sh flip-eth-b | tee -a -i auction-keeper-flip-ETH-B.log`

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

flip-paxusd-a keeper
`./start-keeper.sh flip-paxusd-a | tee -a -i auction-keeper-flip-PAXUSD-A.log`

flip-comp-a keeper
`./start-keeper.sh flip-comp-a | tee -a -i auction-keeper-flip-COMP-A.log`

flip-link-a keeper
`./start-keeper.sh flip-link-a | tee -a -i auction-keeper-flip-LINK-A.log`

flip-lrc-a keeper
`./start-keeper.sh flip-lrc-a | tee -a -i auction-keeper-flip-LRC-A.log`

flip-bal-a keeper
`./start-keeper.sh flip-bal-a | tee -a -i auction-keeper-flip-BAL-A.log`

flip-yfi-a keeper
`./start-keeper.sh flip-yfi-a | tee -a -i auction-keeper-flip-YFI-A.log`

flip-gusd-a keeper
`./start-keeper.sh flip-gusd-a | tee -a -i auction-keeper-flip-GUSD-A.log`

flip-renbtc-a keeper
`./start-keeper.sh flip-renbtc-a | tee -a -i auction-keeper-flip-RENBTC-A.log`

flip-uni-a keeper
`./start-keeper.sh flip-uni-a | tee -a -i auction-keeper-flip-UNI-A.log`

flip-aave-a keeper
`./start-keeper.sh flip-aave-a | tee -a -i auction-keeper-flip-AAVE-A.log`

flip-univ2daieth-a keeper
`./start-keeper.sh flip-univ2daieth-a | tee -a -i auction-keeper-flip-UNIV2DAIETH-A.log`  
NOTE: a local univ2daieth price feed that is used in keeper bids is also started by this command

flap keeper
`./start-keeper.sh flap | tee -a -i auction-keeper-flap.log`

flop keeper
`./start-keeper.sh flop | tee -a -i auction-keeper-flop.log`

### Shutdown
This will gracefully stop keeper and will exit DAI / collateral from Vat contract to keeper operating address.
The shutdown command should be issued from the same directory as the run command but in another console instance.

flip-eth-a keeper
`./stop-keeper.sh flip-eth-a`

flip-eth-b keeper
`./stop-keeper.sh flip-eth-b`

flip-bat-a keeper
`./stop-keeper.sh flip-bat-a`

flip-usdc-a keeper
`./stop-keeper.sh flip-usdc-a`

flip-usdc-a keeper
`./stop-keeper.sh flip-usdc-b`

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

flip-paxusd-a keeper
`./stop-keeper.sh flip-paxusd-a`

flip-comp-a keeper
`./stop-keeper.sh flip-comp-a`

flip-link-a keeper
`./stop-keeper.sh flip-link-a`

flip-lrc-a keeper
`./stop-keeper.sh flip-lrc-a`

flip-bal-a keeper
`./stop-keeper.sh flip-bal-a`

flip-yfi-a keeper
`./stop-keeper.sh flip-yfi-a`

flip-gusd-a keeper
`./stop-keeper.sh flip-gusd-a`

flip-renbtc-a keeper
`./stop-keeper.sh flip-renbtc-a`

flip-uni-a keeper
`./stop-keeper.sh flip-uni-a`

flip-aave-a keeper
`./stop-keeper.sh flip-aave-a`

flip-univ2daieth-a keeper
`./stop-keeper.sh flip-univ2daieth-a`

flap keeper
`./stop-keeper.sh flap`

flop keeper
`./stop-keeper.sh flop`

### Using a dynamic gas price model for bids

- configure following variables in `env/environment.sh` file:
```
# Increase this if you want to use higher price than the one reported
# (e.g. if 2.0 then will use 2 * fast)
GASPRICE_MULTIPLIER=1.3

# ETHGASSTATION_API_KEY is optional.  If you fill it in the auction-keeper
# will use ethgasstation.info for dynamic gas.  Uncomment the line below
# and supply your API key if you wish to use dynamic gas.
#
# ETHGASSTATION_API_KEY=MY_ETH_GASSTATION_KEY

# ETHERSCAN_API_KEY is optional.  If you fill it in the auction-keeper         # will use etherscan API for dynamic gas.  Uncomment the line below            # and supply your API key if you wish to use dynamic gas.                      #                                                                              # ETHERSCAN_API_KEY=MY_ETHERSCAN_API_KEY
```
**Note**: this configuration determines keeper gas price strategy as explained in https://github.com/makerdao/auction-keeper#gas-price-strategy

### Optional additions

Other auction keepers can be added in `docker-compose.yml`.

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
