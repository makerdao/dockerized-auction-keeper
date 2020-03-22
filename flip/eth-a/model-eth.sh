#!/usr/bin/env bash

# dynamic gas library
source ../env/dynamic_gas.sh

while true; do

  # share ETH_URL, DISCOUNT, and GASPRICE_MULTIPLIER
  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "${FLIP_ETH_URL}" -H "accept: application/json")
  ethPrice=$(echo ${body} | jq '.ethereum.usd')
  bidPrice=$(bc -l <<< "${ethPrice} * (1-${FLIP_ETH_DISCOUNT})")

  echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"$(dynamic_gas)\"}"

  sleep 25
done
