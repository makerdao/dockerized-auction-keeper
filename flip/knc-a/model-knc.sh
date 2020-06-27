#!/usr/bin/env bash

# dynamic gas library
source ../env/dynamic_gas.sh

while true; do

  # share KNC_URL, DISCOUNT, and GASPRICE_MULTIPLIER
  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_KNC_URL" -H "accept: application/json")
  kncPrice=$(echo $body | jq '."kyber-network".usd')
  bidPrice=$(bc -l <<< "$kncPrice * (1-$FLIP_KNC_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"$(dynamic_gas)\"}"

  sleep 25
done
