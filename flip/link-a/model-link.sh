#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_LINK_URL" -H "accept: application/json")
  linkPrice=$(echo $body | jq '."chainlink".usd')
  bidPrice=$(bc -l <<< "$linkPrice * (1-$FLIP_LINK_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
