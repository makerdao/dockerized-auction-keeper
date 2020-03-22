#!/usr/bin/env bash

# dynamic gas library
source ../env/dynamic_gas.sh

while true; do

  # share ETH_URL, DISCOUNT, and GASPRICE_MULTIPLIER
  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "${FLOP_MKR_URL}" -H "accept: application/json")
  mkrPrice=$(echo $body | jq '.maker.usd')
  bidPrice=$(bc -l <<< "${mkrPrice} * (1-${FLOP_MKR_DISCOUNT})")

  echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"$(dynamic_gas)\"}"

  sleep 25
done
