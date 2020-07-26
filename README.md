# Docker image for Jhead's Phantom proxy

## Basic usage:
```bash
docker container run --name phantom-proxy -e SERVER=<server ip>:<server_port> --network host nkelemen18/minecraft-phantom-proxy:latest
```
Or with docker compose:

```bash
docker-compose up -d
```

[Example docker-compose file](https://github.com/nkelemen18/Minecraft-Phantom-Proxy-Docker/blob/master/docker-compose.yml)

### Available variables:

 - SERVER: Required: Bedrock/MCPE server IP address and port (ex: 1.2.3.4:19132)
 - IPV6: Optional: Enables IPv6 support on port 19133 (experimental). Pass `1` to enable this flag! (Example: `IPV6=1`)
 - BIND_IP: Optional: IP address to listen on. Defaults to all interfaces. (default "0.0.0.0")
 - BIND_PORT: Optional: Port to listen on. Defaults to 0, which selects a random port.
 - DEBUG: Optional: Enables debug logging. Pass `1` to enable this flag! (Example: `DEBUG=1`)
 - REMOVE_PORTS: Optional: Forces ports to be excluded from pong packets (experimental). Pass `1` to enable this flag! (Example: `REMOVE_PORTS=1`)
 - TIMEOUT: Optional: Seconds to wait before cleaning up a disconnected client (default 60)
 - WORKERS: Optional:  Specify the number of "threads" to use to process data from clients. (Example: `WORKERS=16`)

*Note: host network mode required.*

[Github repo](https://github.com/nkelemen18/Minecraft-Phantom-Proxy-Docker)

[Dockerhub](https://hub.docker.com/repository/docker/nkelemen18/minecraft-phantom-proxy)

The proxy is written by jhead.
[Phantom on GitHub](https://github.com/jhead/phantom)