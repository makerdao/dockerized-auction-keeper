#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_UNI_URL" -H "accept: application/json")
  uniPrice=$(echo $body | jq '."uniswap".usd')
  bidPrice=$(bc -l <<< "$uniPrice * (1-$FLIP_UNI_A_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
