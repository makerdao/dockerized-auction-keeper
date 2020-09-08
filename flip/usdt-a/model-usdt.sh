#!/usr/bin/env bash

# dynamic gas library
source ../env/dynamic_gas.sh

while true; do

  # share USDT_URL, DISCOUNT, and GASPRICE_MULTIPLIER
  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_USDT_URL" -H "accept: application/json")
  usdtPrice=$(echo $body | jq '."tether".usd')
  bidPrice=$(bc -l <<< "$usdtPrice * (1-$FLIP_USDT_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"$(dynamic_gas)\"}"

  sleep 25
done
