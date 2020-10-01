#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_KNC_URL" -H "accept: application/json")
  kncPrice=$(echo $body | jq '."kyber-network".usd')
  bidPrice=$(bc -l <<< "$kncPrice * (1-$FLIP_KNC_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
