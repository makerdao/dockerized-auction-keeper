#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Usage: ./stop-keeper flip-eth-a|flap|flop'
    exit 0
fi

docker exec -it $1 bash -c 'KEEPER="$(pidof python3)"; kill -2 $KEEPER'
