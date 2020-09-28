#!/usr/bin/env bash

# dynamic gas library
source ../env/dynamic_gas.sh

while true; do

  # share LRC_URL, DISCOUNT, and GASPRICE_MULTIPLIER
  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_LRC_URL" -H "accept: application/json")
  lrcPrice=$(echo $body | jq '."loopring".usd')
  bidPrice=$(bc -l <<< "$lrcPrice * (1-$FLIP_LRC_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"$(dynamic_gas)\"}"

  sleep 25
done
