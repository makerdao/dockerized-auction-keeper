#!/usr/bin/env bash

# dynamic gas library
source ../env/dynamic_gas.sh

while true; do

  # share FLIP_WBTC_URL, FLIP_WBTC_DISCOUNT, and GASPRICE_MULTIPLIER
  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "${FLIP_WBTC_URL}" -H "accept: application/json")
  bitcoinPrice=$(echo ${body} | jq '.bitcoin.usd')
  bidPrice=$(bc -l <<< "${bitcoinPrice} * (1-${FLIP_WBTC_DISCOUNT})")

  echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"$(dynamic_gas)\"}"

  sleep 25
done
