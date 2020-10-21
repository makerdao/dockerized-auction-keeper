#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Usage: ./start-interactive-keeper flip-eth-a|flap|flop'
    exit 0
fi

docker-compose run --rm --name $1 $1
