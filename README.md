# ZCC Cli Docker Image

[![Build Status](https://travis-ci.org/ety001/docker-zcc-cli.svg?branch=master)](https://travis-ci.org/ety001/docker-zcc-cli)

## How to use

1. Pull repository
```
docker pull ety001/docker-zcc-cli
```

2. To test
```
docker -it --rm --net="host" ety001/docker-zcc-cli --help
```

3. Create the .zccoin folder
```
mkdir /root/.zccoin
```

4. Add a configuration
```
echo "server=1
rpcuser=YOUR_USER_NAME
rpcpassword=YOUR_PASSWORD" > /root/.zccoin/zccoin.conf
```

5. Run the wallet
```
docker run -it --rm --net="host" -v /root/.zccoin:/root/.zccoin ety001/docker-zcc-cli 
```

6. To test the RPC
```
curl -u YOUR_USER_NAME --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getinfo", "params": [] }' -H 'content-type: text/plain;' http://127.0.0.1:12210/
```
