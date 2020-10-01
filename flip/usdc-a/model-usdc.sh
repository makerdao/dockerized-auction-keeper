#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_USDC_URL" -H "accept: application/json")
  usdcPrice=$(echo $body | jq '."usd-coin".usd')
  bidPrice=$(bc -l <<< "$usdcPrice * (1-$FLIP_USDC_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
