#!/usr/bin/env bash
base_url="https://github.com/OwO-Network/DeepLX"

update=0
last_version=$(curl https://api.github.com/repos/OwO-Network/DeepLX/releases/latest | jq .name)
if [[ ! -f ./version ]] || [[ ! -f ./deeplx ]]; then
    update=1
elif [[ $last_version != $(cat ./version) ]]; then
    update=1
fi

if [[ $update == 1 ]]; then
    wget $base_url/releases/download/${last_version//\"/}/deeplx_linux_amd64 -O deeplx
    chmod +x ./deeplx
    echo $last_version > ./version
fi
./deeplx -p 443
