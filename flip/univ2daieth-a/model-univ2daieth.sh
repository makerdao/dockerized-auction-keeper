#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_UNIV2DAIETH_URL" -H "accept: application/json")
  univ2daiethPrice=$(echo $body | jq '.price')
  bidPrice=$(bc -l <<< "univ2daiethPrice * (1-$FLIP_UNIV2DAIETH_A_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
