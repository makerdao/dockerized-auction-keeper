#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_MANA_URL" -H "accept: application/json")
  manaPrice=$(echo $body | jq '."decentraland".usd')
  bidPrice=$(bc -l <<< "$manaPrice * (1-$FLIP_MANA_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
