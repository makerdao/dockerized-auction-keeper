#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "${FLIP_WBTC_URL}" -H "accept: application/json")
  bitcoinPrice=$(echo ${body} | jq '.bitcoin.usd')
  bidPrice=$(bc -l <<< "${bitcoinPrice} * (1-${FLIP_WBTC_DISCOUNT})")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
