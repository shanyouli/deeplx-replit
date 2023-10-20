base_url="https://github.com/OwO-Network/DeepLX"

update=0

if [[ ! -f ./version ]] || [[ ! -f ./deeplx ]]; then
    update=1
    last_version=$(curl https://api.github.com/repos/OwO-Network/DeepLX/releases/latest | jq .name)
else
    if [[ -x ./deeplx ]]; then
        last_version=$(curl https://api.github.com/repos/OwO-Network/DeepLX/releases/latest | jq .name)
        if [[ $last_version != $(cat ./version) ]]; then
            update=1
        fi
    fi
fi

echo $last_version
if [[ $update == 1 ]]; then
    wget $base_url/releases/download/${last_version//\"/}/deeplx_linux_amd64 -O deeplx
    chmod +x ./deeplx
    echo $last_version > ./version
fi
./deeplx -p 443
