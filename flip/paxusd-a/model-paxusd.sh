#!/usr/bin/env bash

while true; do

  source ../env/environment.sh

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_PAXUSD_URL" -H "accept: application/json")
  paxusdPrice=$(echo $body | jq '."paxos-standard".usd')
  bidPrice=$(bc -l <<< "$paxusdPrice * (1-$FLIP_PAXUSD_A_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\"}"

  sleep 25
done
