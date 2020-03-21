#!/usr/bin/env bash

while true; do

  source ../env/environment.sh # share BAT_URL, DISCOUNT, and GAS_PERCENT

  # dynamic gas price
  res=$(curl -s -X POST \
    -H "Content-Type: application/json" \
    --data "{\"jsonrpc\":\"2.0\",\"method\":\"eth_gasPrice\",\"params\":[],\"id\":${RANDOM}}" \
    http://${SERVER_ETH_RPC_HOST}:${SERVER_ETH_RPC_PORT} \
    | jq -r '.result' \
    | sed 's/0x//')
  gas=$(bc <<<"ibase=16; $(tr a-f A-F <<<"${res}")")
  gasPrice=$(bc -l <<< "scale=0; (${gas} * (1 + ${GAS_PERCENT}))/1")

  # dynamic bid price
  body=$(curl -s -X GET "$FLIP_BAT_URL" -H "accept: application/json")
  batPrice=$(echo $body | jq '."basic-attention-token".usd')
  bidPrice=$(bc -l <<< "$batPrice * (1-$FLIP_BAT_DISCOUNT)")

  echo "{\"price\": \"${bidPrice}\", \"gasPrice\": \"${gasPrice}\"}"

  sleep 25
done
