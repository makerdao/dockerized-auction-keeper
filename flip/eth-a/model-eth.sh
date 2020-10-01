#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "${FLIP_ETH_URL}" -H "accept: application/json")
  ethPrice=$(echo ${body} | jq '.ethereum.usd')
  bidPrice=$(bc -l <<< "${ethPrice} * (1-${FLIP_ETH_DISCOUNT})")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
