#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Usage: ./start-keeper flip-eth-a|flap|flop'
    exit 0
fi

docker-compose up $1
