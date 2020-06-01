#!/usr/bin/env bash

# dynamic gas library
source ../env/dynamic_gas.sh

while true; do

  # share TUSD_URL, DISCOUNT, and GASPRICE_MULTIPLIER
  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_TUSD_URL" -H "accept: application/json")
  tusdPrice=$(echo $body | jq '."true-usd".usd')
  bidPrice=$(bc -l <<< "$tusdPrice * (1-$FLIP_TUSD_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"$(dynamic_gas)\"}"

  sleep 25
done
