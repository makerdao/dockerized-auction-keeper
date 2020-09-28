#!/usr/bin/env bash

# dynamic gas library
source ../env/dynamic_gas.sh

while true; do

  # share LINK_URL, DISCOUNT, and GASPRICE_MULTIPLIER
  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_LINK_URL" -H "accept: application/json")
  linkPrice=$(echo $body | jq '."link".usd')
  bidPrice=$(bc -l <<< "$linkPrice * (1-$FLIP_LINK_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"$(dynamic_gas)\"}"

  sleep 25
done
