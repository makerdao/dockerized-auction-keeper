#!/usr/bin/env bash

while true; do

   source ../env/environment.sh # share BAT_URL, DISCOUNT, and GASPRICE

   body=$(curl -s -X GET "$FLIP_BAT_URL" -H "accept: application/json")

   batPrice=$(echo $body | jq '."basic-attention-token".usd')

   bidPrice=$(bc -l <<< "$batPrice * (1-$FLIP_BAT_DISCOUNT)")

   echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"${FLIP_GASPRICE}\"}"

   sleep 25
done
