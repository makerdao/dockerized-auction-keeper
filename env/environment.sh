# host and port
SERVER_ETH_RPC_HOST=https://paritynodehere
SERVER_ETH_RPC_PORT=8545
# ETHGASSTATION_API_KEY is optional.  If you fill it in the model will use
# ethgasstation.info for dynamic gas, otherwise we will simply check the node.
ETHGASSTATION_API_KEY=MY_ETH_GASSTATION_KEY
ETHGASSTATION_URL=https://ethgasstation.info/json/ethgasAPI.json?api-key=$ETHGASSTATION_API_KEY
# other options: safeLow, average, fast
ETHGASSTATION_MODE=fastest
# increase this if you want to use higher price than the one reported
# (e.g. if 2.0 then will use 2 * fastest)
GASPRICE_MULTIPLIER=1.4
FULL_PATH_TO_KEEPER_DIRECTORY=/opt/keeper/auction-keeper
FIRST_BLOCK_TO_CHECK=14764534

###### FLIP-ETH-A Config ######
FLIP_ACCOUNT_ADDRESS=0x40418bxxxxxx
FLIP_ETH_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-a.json,pass_file=/opt/keeper/secrets/password-flip-a.txt'
FLIP_DAI_IN_VAT=1000
FLIP_ILK=ETH-A
FLIP_MINIMUM_AUCTION_ID_TO_CHECK=1800

FLIP_ETH_URL="https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=usd"
FLIP_ETH_DISCOUNT=0.25 # e.g. 0.25 = 25% discount from FMV

###### FLIP-BAT-A Config ######
FLIP_ACCOUNT_ADDRESS=0x40418bxxxxxx
FLIP_BAT_A_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flip-a.json,pass_file=/opt/keeper/secrets/password-flip-a.txt'
FLIP_DAI_IN_VAT=1000
FLIP_ILK_BAT=BAT-A
FLIP_MINIMUM_AUCTION_ID_TO_CHECK=1800

FLIP_BAT_URL="https://api.coingecko.com/api/v3/simple/price?ids=basic-attention-token&vs_currencies=usd"
FLIP_BAT_DISCOUNT=0.25 # e.g. 0.25 = 25% discount from FMV

###### FLOP Config ######
FLOP_ACCOUNT_ADDRESS=0x40418bxxxxxx
FLOP_ACCOUNT_KEY='key_file=/opt/keeper/secrets/keystore-flop.json,pass_file=/opt/keeper/secrets/password-flop.txt'
FLOP_DAI_IN_VAT=5000000

FLOP_MKR_URL="https://api.coingecko.com/api/v3/simple/price?ids=maker&vs_currencies=usd"
FLOP_MKR_DISCOUNT=0.25 # e.g. 0.25 = 25% discount from FMV
