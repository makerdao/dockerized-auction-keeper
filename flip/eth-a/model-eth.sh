#!/usr/bin/env bash

while true; do

   source environment.sh  # share ETH_URL, DISCOUNT, and GASPRICE

   body=$(curl -s -X GET "$FLIP_ETH_URL" -H "accept: application/json")

   ethPrice=$(echo $body | jq '.ethereum.usd')

   bidPrice=$(bc -l <<< "$ethPrice * (1-$FLIP_ETH_DISCOUNT)")

   echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"${FLIP_GASPRICE}\"}"

   sleep 25
done
