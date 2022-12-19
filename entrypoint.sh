#!/usr/bin/env bash

if [ "$PHANTOM_VER" == "latest" ]; then
  PHANTOM_VER=$(lastversion jhead/phantom)
fi

if [ "$PHANTOM_VER" == "latestpre" ]; then
  PHANTOM_VER=$(lastversion --pre jhead/phantom)
fi


rm phantom-linux*

wget "https://github.com/jhead/phantom/releases/download/v${PHANTOM_VER}/phantom-linux"
wget "https://github.com/jhead/phantom/releases/download/v${PHANTOM_VER}/phantom-linux-arm5"
wget "https://github.com/jhead/phantom/releases/download/v${PHANTOM_VER}/phantom-linux-arm6"
wget "https://github.com/jhead/phantom/releases/download/v${PHANTOM_VER}/phantom-linux-arm7"
wget "https://github.com/jhead/phantom/releases/download/v${PHANTOM_VER}/phantom-linux-arm8"

mv phantom-linux phantom-linux-${PHANTOM_ARCH}

chmod +x phantom-linux*


export IFS=";"
for servadd in ${SERVER}; do

  command=("./phantom-linux-${PHANTOM_ARCH} -server $servadd")

  if [[ -v IPV6 ]] && [ "$IPV6" == "1" ]; then
    command+=("-6")
  fi

  if [[ -v BIND_IP ]]; then
    command+=("-bind ${BIND_IP}")
  fi

  if [[ -v BIND_PORT ]]; then
    command+=("-bind_port ${BIND_PORT}")
  fi

  if [[ -v DEBUG ]] && [ "$DEBUG" == "1" ]; then
    command+=("-debug")
  fi

  if [[ -v REMOVE_PORTS ]] && [ "$REMOVE_PORTS" == "1" ]; then
    command+=("-remove_ports")
  fi

  if [[ -v TIMEOUT ]]; then
    command+=("-timeout ${TIMEOUT}")
  fi

  if [[ -v WORKERS ]]; then
    command+=("-workers ${WORKERS}")
  fi

  command+=("&")
  echo "Starting proxy: ${command[@]}"

  eval ${command[@]}


done

wait


#echo "Starting proxy: ${command[@]}"

#eval ${command[@]}
