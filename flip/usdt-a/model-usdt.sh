#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_USDT_URL" -H "accept: application/json")
  usdtPrice=$(echo $body | jq '."tether".usd')
  bidPrice=$(bc -l <<< "$usdtPrice * (1-$FLIP_USDT_A_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
