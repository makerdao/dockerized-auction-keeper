#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_TUSD_URL" -H "accept: application/json")
  tusdPrice=$(echo $body | jq '."true-usd".usd')
  bidPrice=$(bc -l <<< "$tusdPrice * (1-$FLIP_TUSD_A_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
