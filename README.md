This Mordhau Dedicated Server requires ports UDP 15000, 27015, and 7777 to be published on the container and accessible.

The server may be started with docker-compose
```
docker-compose up
```

or with Docker (the below assumes being run locally)
```
docker build -t mordhau-server .
docker run -p 15000:15000/udp -p 27015:27015/udp -p 7777:7777/udp
```

