#!/usr/bin/env bash

source environment.sh  # share ETH_URL, DISCOUNT, and GASPRICE

while true; do

   body=$(curl -s -X GET "$ETH_URL" -H "accept: application/json")

   ethPrice=$(echo $body | jq '.ethereum.usd')

   bidPrice=$(bc -l <<< "$ethPrice * $DISCOUNT")

   echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"${GASPRICE}\"}"

   sleep 25
done
