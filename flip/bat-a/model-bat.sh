#!/usr/bin/env bash

# dynamic gas library
source ../env/dynamic_gas.sh

while true; do

  # share BAT_URL, DISCOUNT, and GASPRICE_MULTIPLIER
  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_BAT_URL" -H "accept: application/json")
  batPrice=$(echo $body | jq '."basic-attention-token".usd')
  bidPrice=$(bc -l <<< "$batPrice * (1-$FLIP_BAT_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"$(dynamic_gas)\"}"

  sleep 25
done
