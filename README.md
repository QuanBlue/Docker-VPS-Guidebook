<h1 align="center">
  <img src="./../assets/../dockervps/assets/docker-logo.png" alt="icon" width="200"></img>
  <br>
  <b>Create Docker VPS</b>
</h1>

<p align="center">Using Docker-compose to create Docker VPS.</p>

<p align="center">
  <b>
    <a href="#usage">Usage</a> •
    <a href="#customize">Customize</a> •
    <a href="#license">License</a>
  </b>
</p>

## Usage

Build containers

```sh
$ docker-compose up -d

WARNING: The "docker-vps" service specifies a port on the host. If multiple containers for this service are created on a single host, the port will clash.
Recreating dockervps_docker-vps_1 ... done
Recreating dockervps_docker-vps_2 ... done
Recreating dockervps_docker-vps_3 ... done
```

Check created containers

```sh
$ docker-compose ps

         Name               Command       State               Ports
--------------------------------------------------------------------------------
dockervps_docker-vps_1   /entrypoint.sh   Up      0.0.0.0:1001->22/tcp,
                                                  2375/tcp, 2376/tcp
dockervps_docker-vps_2   /entrypoint.sh   Up      0.0.0.0:1000->22/tcp,
                                                  2375/tcp, 2376/tcp
dockervps_docker-vps_3   /entrypoint.sh   Up      0.0.0.0:1002->22/tcp,
                                                  2375/tcp, 2376/tcp
```

Connect to container

```sh
# get docker network ip
$ ifconfig
docker0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 172.17.0.1  netmask 255.255.0.0  broadcast 172.17.255.255
        ether 02:42:b0:58:cb:c8  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
...

# Connect to container by ssh
# ssh [user]@[docker network ip] -p [container port]
# user: quanblue - password: 123
$ ssh quanblue@172.17.0.1 -p 1000
quanblue@172.17.0.1's password:
Welcome to Alpine!

The Alpine Wiki contains a large amount of how-to guides and general
information about administrating Alpine systems.
See <https://wiki.alpinelinux.org/>.

You can setup the system with the command: setup-alpine

You may change this message by editing /etc/motd.

ef55eb1d27aa:~$

```

## Customize

Add or change user - check it in `Dockerfile`

```dockerfile
# find this line and change it properties
RUN echo -n 'quanblue:123' | chpasswd

# change to
RUN echo -n '<user>:<password>' | chpasswd
```

Change number of vps instance

```yml
# find this line and change it properties
replicas: 3
ports:
  - "1000-1005:22"

# change to
replicas: <number_of_instance>
ports:
  - "<host_port_range>:22"

```

## License

Distributed under the MIT License. See <a href="../LICENSE">`LICENSE`</a> for more information.

---

> Bento [@quanblue](https://bento.me/quanblue) &nbsp;&middot;&nbsp;
> GitHub [@QuanBlue](https://github.com/QuanBlue) &nbsp;&middot;&nbsp; Gmail quannguyenthanh558@gmail.com
