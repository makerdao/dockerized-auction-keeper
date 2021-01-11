#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_AAVE_URL" -H "accept: application/json")
  aavePrice=$(echo $body | jq '."aave".usd')
  bidPrice=$(bc -l <<< "$aavePrice * (1-$FLIP_AAVE_A_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
