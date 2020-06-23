#!/usr/bin/env bash

# dynamic gas library
source ../env/dynamic_gas.sh

while true; do

  # share ZRX_URL, DISCOUNT, and GASPRICE_MULTIPLIER
  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_ZRX_URL" -H "accept: application/json")
  zrxPrice=$(echo $body | jq '."0x".usd')
  bidPrice=$(bc -l <<< "$zrxPrice * (1-$FLIP_ZRX_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"$(dynamic_gas)\"}"

  sleep 25
done
