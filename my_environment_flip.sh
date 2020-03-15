SERVER_ETH_RPC_HOST=https://kovan-node-here
SERVER_ETH_RPC_PORT=8545
ACCOUNT_ADDRESS=0x40418xxxxxxx
ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore.json,pass_file=/opt/keeper/secrets/password.txt'

FULL_PATH_TO_KEEPER_DIRECTORY=/opt/keeper/auction-keeper
DAI_IN_VAT=1000
ILK=ETH-A

FIRST_BLOCK_TO_CHECK=14574534
MINIMUM_AUCTION_ID_TO_CHECK=1800

# Pricing Model
ETH_URL="https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=usd"
DISCOUNT=0.5 # e.g. 0.5 = 50% discount from FMV
GASPRICE=100000000000 # Fixed