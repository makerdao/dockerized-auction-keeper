#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_BAL_URL" -H "accept: application/json")
  balPrice=$(echo $body | jq '."balancer".usd')
  bidPrice=$(bc -l <<< "$balPrice * (1-$FLIP_BAL_A_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
