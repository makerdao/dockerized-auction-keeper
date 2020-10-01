#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "${FLOP_MKR_URL}" -H "accept: application/json")
  mkrPrice=$(echo $body | jq '.maker.usd')
  bidPrice=$(bc -l <<< "${mkrPrice} * (1-${FLOP_MKR_DISCOUNT})")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
