# Cntlm Docker

This is a simple dockerfile that wraps up cntlm into debian. It will set up a open proxy, that uses NTLMv2 to
authenticate upstream. The main use case is to get a simple proxy setup that plays nice with windows networks.

Ideally you can use this with redsocks+iptables, to make docker images think they have direct access, but the connections are
actually tunneled through.

container->redsocks->ctnlm->upstream

## Usage

Simple usage is 

`docker run --rm -p 3128:3128 btrepp/cntlm user.name domain NTVLMv2Hash upstream_proxy:port`

This will create an unathenticated proxy on the host running at 3128

## NTLMv2 Hash

By default I've only set this up to accept Hashed passwords. cntlm supports actual passwords, but 
that is left up to you to figure out. A script exists in the images that will help you get the hash

`docker run --rm -t -i --entrypoint="get_ntlm.sh" btrepp/cntlm user.name@domain upstream_proxy:port`

This will ask you for your password and attempt to use the upstream proxy to get to docker.io. If it
succeeds it will print a PassNTLMv2 line, use this hash above when launching the container.


## Contributing

This was a quick hack to get together as nothing currently existed on the registry. Feel free to fork it and send pull requests
