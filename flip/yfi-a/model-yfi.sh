#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_YFI_URL" -H "accept: application/json")
  yfiPrice=$(echo $body | jq '."yearn-finance".usd')
  bidPrice=$(bc -l <<< "$yfiPrice * (1-$FLIP_YFI_A_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
