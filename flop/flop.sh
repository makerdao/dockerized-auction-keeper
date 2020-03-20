#!/bin/bash
dir="$(dirname "$0")"

source ../env/environment.sh  # Set the RPC host, account address, keys, and everything else
source ${FULL_PATH_TO_KEEPER_DIRECTORY}/_virtualenv/bin/activate # Run virtual environment

# Allows keepers to bid different prices
MODEL=$1

${FULL_PATH_TO_KEEPER_DIRECTORY}/bin/auction-keeper \
    --rpc-host ${SERVER_ETH_RPC_HOST:?} \
    --rpc-port ${SERVER_ETH_RPC_PORT?:} \
    --rpc-timeout 30 \
    --eth-from ${FLOP_ACCOUNT_ADDRESS?:} \
    --eth-key ${FLOP_ACCOUNT_KEY?:} \
    --type flop \
    --max-auctions 100 \
    --ethgasstation-api-key ${ETHGASSTATION_API_KEY} \
    --vat-dai-target ${FLOP_DAI_IN_VAT} \
    --from-block ${FIRST_BLOCK_TO_CHECK} \
    --bid-only \
    --model ${dir}/${MODEL}