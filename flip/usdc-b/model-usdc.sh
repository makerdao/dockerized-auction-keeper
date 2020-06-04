#!/usr/bin/env bash

# dynamic gas library
source ../env/dynamic_gas.sh

while true; do

  # share USDC_URL, DISCOUNT, and GASPRICE_MULTIPLIER
  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_USDC_URL" -H "accept: application/json")
  usdcPrice=$(echo $body | jq '."usd-coin".usd')
  bidPrice=$(bc -l <<< "$usdcPrice * (1-$FLIP_USDC_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"$(dynamic_gas)\"}"

  sleep 25
done
