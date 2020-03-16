#!/bin/bash
dir="$(dirname "$0")"

source my_environment_flip.sh  # Set the RPC host, account address, keys, and everything else
source ${FULL_PATH_TO_KEEPER_DIRECTORY}/_virtualenv/bin/activate # Run virtual environment

# Allows keepers to bid different prices
MODEL=$1

${FULL_PATH_TO_KEEPER_DIRECTORY}/bin/auction-keeper \
    --rpc-host ${SERVER_ETH_RPC_HOST:?} \
    --rpc-port ${SERVER_ETH_RPC_PORT?:} \
    --rpc-timeout 30 \
    --eth-from ${ACCOUNT_ADDRESS?:} \
    --eth-key ${ACCOUNT_KEY?:} \
    --type flip \
    --max-auctions 100 \
    --ilk ${ILK} \
    --from-block ${FIRST_BLOCK_TO_CHECK} \
    --min-auction ${MINIMUM_AUCTION_ID_TO_CHECK} \
    --vat-dai-target ${DAI_IN_VAT} \
    --model ${dir}/${MODEL}