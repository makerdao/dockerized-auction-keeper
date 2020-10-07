#!/bin/bash
dir="$(dirname "$0")"

source ../env/environment.sh  # Set the RPC host, account address, keys, and everything else
source ../env/dynamic_gas.sh
source ${FULL_PATH_TO_KEEPER_DIRECTORY}/_virtualenv/bin/activate # Run virtual environment

# Allows keepers to bid different prices
MODEL=$1

${FULL_PATH_TO_KEEPER_DIRECTORY}/bin/auction-keeper \
    --rpc-host ${SERVER_ETH_RPC_HOST:?} \
    --rpc-timeout 30 \
    --eth-from ${FLAP_ACCOUNT_ADDRESS?:} \
    --eth-key ${FLAP_ACCOUNT_KEY?:} \
    --type flap \
    --max-auctions 100 \
    $(dynamic_gas_params) \
    --vat-dai-target ${FLAP_DAI_IN_VAT} \
    --from-block ${FIRST_BLOCK_TO_CHECK} \
    --bid-only \
    --model ${dir}/${MODEL}
