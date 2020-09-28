#!/usr/bin/env bash

# dynamic gas library
source ../env/dynamic_gas.sh

while true; do

  # share COMP_URL, DISCOUNT, and GASPRICE_MULTIPLIER
  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_COMP_URL" -H "accept: application/json")
  compPrice=$(echo $body | jq '."compound-governance-token".usd')
  bidPrice=$(bc -l <<< "$compPrice * (1-$FLIP_COMP_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"$(dynamic_gas)\"}"

  sleep 25
done
