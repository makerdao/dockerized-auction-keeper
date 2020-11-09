#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_LRC_URL" -H "accept: application/json")
  lrcPrice=$(echo $body | jq '."loopring".usd')
  bidPrice=$(bc -l <<< "$lrcPrice * (1-$FLIP_LRC_A_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
