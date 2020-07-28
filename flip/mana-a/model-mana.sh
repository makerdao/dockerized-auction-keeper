#!/usr/bin/env bash

# dynamic gas library
source ../env/dynamic_gas.sh

while true; do

  # share MANA_URL, DISCOUNT, and GASPRICE_MULTIPLIER
  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_MANA_URL" -H "accept: application/json")
  manaPrice=$(echo $body | jq '."decentraland".usd')
  bidPrice=$(bc -l <<< "$manaPrice * (1-$FLIP_MANA_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"$(dynamic_gas)\"}"

  sleep 25
done
