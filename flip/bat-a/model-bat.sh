#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_BAT_URL" -H "accept: application/json")
  batPrice=$(echo $body | jq '."basic-attention-token".usd')
  bidPrice=$(bc -l <<< "$batPrice * (1-$FLIP_BAT_A_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
