#!/bin/bash

dynamic_gas_params()
{
  if [ -n "$ETHGASSTATION_API_KEY" ] && [ -n "$ETHERSCAN_API_KEY" ]; then
    echo "--oracle-gas-price --gas-initial-multiplier=${GASPRICE_MULTIPLIER} --ethgasstation-api-key=${ETHGASSTATION_API_KEY} --etherscan-api-key=${ETHERSCAN_API_KEY}"
  elif [ -n "$ETHGASSTATION_API_KEY" ]; then
    echo "--oracle-gas-price --gas-initial-multiplier=${GASPRICE_MULTIPLIER} --ethgasstation-api-key=${ETHGASSTATION_API_KEY}"
  elif [ -n "$ETHERSCAN_API_KEY" ]; then
    echo "--oracle-gas-price --gas-initial-multiplier=${GASPRICE_MULTIPLIER} --etherscan-api-key=${ETHERSCAN_API_KEY}"
  else
    echo "--gas-initial-multiplier=${GASPRICE_MULTIPLIER}"
  fi
}
