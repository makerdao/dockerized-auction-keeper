#!/usr/bin/env bash

# dynamic gas library
source ../env/dynamic_gas.sh

while true; do

  # share PAXUSD_URL, DISCOUNT, and GASPRICE_MULTIPLIER
  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_PAXUSD_URL" -H "accept: application/json")
  paxusdPrice=$(echo $body | jq '."paxos-standard".usd')
  bidPrice=$(bc -l <<< "$paxusdPrice * (1-$FLIP_PAXUSD_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"$(dynamic_gas)\"}"

  sleep 25
done
