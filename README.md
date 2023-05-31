<h1 align="center">
  <img src="./assets/docker-logo.png" alt="icon" width="200"></img>
  <br>
  <b>Create Docker VPS</b>
</h1>

<p align="center">Helping you create Docker VPS in order to run Docker Swarm, Kubernetes, ...</p>

<!-- Badges -->
<p align="center">
  <a href="https://github.com/QuanBlue/Docker-VPS/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/QuanBlue/Docker-VPS" alt="contributors" />
  </a>
  <a href="">
    <img src="https://img.shields.io/github/last-commit/QuanBlue/Docker-VPS" alt="last update" />
  </a>
  <a href="https://github.com/QuanBlue/Docker-VPS/network/members">
    <img src="https://img.shields.io/github/forks/QuanBlue/Docker-VPS" alt="forks" />
  </a>
  <a href="https://github.com/QuanBlue/Docker-VPS/stargazers">
    <img src="https://img.shields.io/github/stars/QuanBlue/Docker-VPS" alt="stars" />
  </a>
  <a href="https://github.com/QuanBlue/Docker-VPS/issues/">
    <img src="https://img.shields.io/github/issues/QuanBlue/Docker-VPS" alt="open issues" />
  </a>
  <a href="https://github.com/QuanBlue/Docker-VPS/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/QuanBlue/Docker-VPS.svg" alt="license" />
  </a>
</p>

<p align="center">
  <b>
    <a href="https://github.com/QuanBlue/Docker-VPS">Documentation</a> •
    <a href="https://github.com/QuanBlue/Docker-VPS/issues/">Report Bug</a> •
    <a href="https://github.com/QuanBlue/Docker-VPS/issues/">Request Feature</a>
  </b>
</p>
<br/>
<details open>
<summary>Table of Contents</summary>

-  [Getting Started](#getting-started)
   -  [Prerequisites](#prerequisites)
-  [Usage](#usage)
-  [Roadmap](#roadmap)
-  [Contributors](#contributors)
-  [Credits](#credits)
-  [License](#license)
-  [Related Projects](#related-projects)
</details>

## Getting Started

### Prerequisites

Before proceeding with the installation and usage of this project, ensure that you have the following prerequisites in place:

-  **Docker Engine:** Docker provides a consistent and portable environment for running applications in containers. Install [here](https://www.docker.com/get-started/).
-  **Network Connectivity:** Docker requires network connectivity to download images, communicate with containers, and access external resources.

## Usage

Start the init DinD container

```sh
docker run -d --privileged --name <container_1> docker:dind
```

Initialize a Docker Swarm on the first DinD container:

```sh
docker exec -it <container_1> docker swarm init
```

> **Note:**
>
> -  Obtain the join token from the output of the previous command. It should look similar to:  
>    `docker swarm join --token <token> <manager-ip>:<manager-port>`
> -  If you forget the join token, you can get it by running the following command on the manager node: `docker swarm join-token worker`

Start additional DinD containers and join them to the Swarm

```sh
# Start additional DinD containers
docker run -d --privileged --name <container_n> docker:dind

# Join swarm
docker exec -it <container_n> docker swarm join --token <token> <manager-ip>:<manager-port>
```

> **Note:** If you want to attach and control this container, you can use the following command:
> `docker exec -it <container_n> /bin/sh`

## Roadmap

Create Docker VPS

-  [ ] Using Docker-compose
-  [ ] Using Virtual machine (VirtualBox)

## Contributors

<a href="https://github.com/QuanBlue/Linux-Bootstrap/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=QuanBlue/Linux-Bootstrap" />
</a>

Contributions are always welcome!

## Credits

-  [Docker](https://www.docker.com/)
-  [Docker-in-docker](https://hub.docker.com/_/docker)

## License

Distributed under the MIT License. See <a href="../LICENSE">`LICENSE`</a> for more information.

## Related Projects

-  <u>[**Docker practice lab**](https://github.com/QuanBlue/Docker-practice-lab)</u>: Practice Docker with Docker, Docker Swarm,... from beginner to advanced.

---

> Bento [@quanblue](https://bento.me/quanblue) &nbsp;&middot;&nbsp;
> GitHub [@QuanBlue](https://github.com/QuanBlue) &nbsp;&middot;&nbsp; Gmail quannguyenthanh558@gmail.com
