#!/bin/bash
dir="$(dirname "$0")"

source ../env/environment.sh  # Set the RPC host, account address, keys, and everything else
source ../env/dynamic_gas.sh
source ${FULL_PATH_TO_KEEPER_DIRECTORY}/_virtualenv/bin/activate # Run virtual environment

# Allows keepers to bid different prices
MODEL=$1

${FULL_PATH_TO_KEEPER_DIRECTORY}/bin/auction-keeper \
    --rpc-host ${SERVER_ETH_RPC_HOST:?} \
    --rpc-timeout 300 \
    --eth-from ${FLIP_UNIV2DAIETH_A_ACCOUNT_ADDRESS?:} \
    --eth-key ${FLIP_UNIV2DAIETH_A_ACCOUNT_KEY?:} \
    --type flip \
    --max-auctions 100 \
    $(dynamic_gas_params) \
    --vat-dai-target ${FLIP_UNIV2DAIETH_A_DAI_IN_VAT} \
    --from-block ${FIRST_BLOCK_TO_CHECK} \
    --ilk ${FLIP_ILK_UNIV2DAIETH_A} \
    --bid-only \
    --min-auction ${FLIP_MINIMUM_UNIV2DAIETH_A_AUCTION_ID_TO_CHECK} \
    --model ${dir}/${MODEL}
