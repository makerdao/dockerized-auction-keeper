#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_COMP_URL" -H "accept: application/json")
  compPrice=$(echo $body | jq '."compound-governance-token".usd')
  bidPrice=$(bc -l <<< "$compPrice * (1-$FLIP_COMP_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
