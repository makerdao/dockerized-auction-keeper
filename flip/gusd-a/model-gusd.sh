#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_GUSD_URL" -H "accept: application/json")
  gusdPrice=$(echo $body | jq '."gemini-dollar".usd')
  bidPrice=$(bc -l <<< "$gusdPrice * (1-$FLIP_GUSD_A_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
