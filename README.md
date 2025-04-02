# Load Balancing Demo for extra slow web servers

## Introduction

* Apache Webserver executes PHP script with a 5sec delay for each request
* Apache server is configured to run single threaded (for demo purpose)
* docker file provided to buidl the Apache image
* and docker compose file defines a stack of three Apache servers and a Caddy Load balancer

## build docker image 

`docker build -t slow-server .`

## run single docker container

`docker run -d --name slow-server -p 80:80 slow-server:latest `

### demonstrate slow responses for multiple connections

```
sven@xub2204-m169:~$ time curl localhost &
[1] 34639
sven@xub2204-m169:~$ time curl localhost &
[2] 34641
sven@xub2204-m169:~$ time curl localhost &
[3] 34645
sven@xub2204-m169:~$ Hello, here is a response from Server IP: 172.17.0.2

real	0m5.016s
user	0m0.004s
sys	0m0.008s
Hello, here is a response from Server IP: 172.17.0.2

real	0m9.047s
user	0m0.004s
sys	0m0.007s
Hello, here is a response from Server IP: 172.17.0.2

real	0m13.473s
user	0m0.008s
sys	0m0.003s
```

## using load balaning (caddy)

`docker compose up`

### demonstrate load balancing speedup for multiple connections

```
sven@xub2204-m169:~$ time curl localhost &
[5] 35383
sven@xub2204-m169:~$ time curl localhost &
[6] 35386
sven@xub2204-m169:~$ Hello, here is a response from Server IP: 172.19.0.4

real	0m5.009s
user	0m0.000s
sys	0m0.005s
Hello, here is a response from Server IP: 172.19.0.3

real	0m5.008s
user	0m0.006s
sys	0m0.000s
Hello, here is a response from Server IP: 172.19.0.4

real	0m13.503s
user	0m0.003s
sys	0m0.008s

```
