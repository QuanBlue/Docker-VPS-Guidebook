<h1 align="center">
  <img src="./assets/docker-logo.png" alt="icon" width="200"></img>
  <br>
  <b>Docker VPS - Docker Swarm</b>
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
<summary><b>Table of Contents</b></summary>

-  [Getting Started](#toolbox-getting-started)
   -  [Prerequisites](#pushpin-prerequisites)
   -  [Environment Variables](#key-environment-variables)
-  [Usage](#rocket-usage)
   -  [Create Docker VPS](#desktop_computer-create-docker-vps)
   -  [Create Docker Swarm](#chains-create-docker-swarm)
      -  [Way 1: Using Shell script](#way-1-using-shell-script-to-auto-create-swarm)
      -  [Way 2: Manually](#way-2-manually-create-swarm)
-  [Practice](#building_construction-practice)
-  [Roadmap](#world_map-roadmap)
-  [Contributors](#busts_in_silhouette-contributors)
-  [Credits](#sparkles-credits)
-  [License](#scroll-license)
-  [Related Projects](#link-related-projects)
</details>

# :toolbox: Getting Started

## :pushpin: Prerequisites

Before proceeding with the installation and usage of this project, ensure that you have the following prerequisites in place:

-  **Docker Engine:** Docker provides a consistent and portable environment for running applications in containers. Install [here](https://www.docker.com/get-started/).
-  **Network Connectivity:** Docker requires network connectivity to download images, communicate with containers, and access external resources.

## :key: Environment Variables

**If you want to auto create Docker Swarm** by [this way](#way-1-using-shell-script-to-auto-create-swarm), you need to add the following environment variables to your `.env` file in `/`:

-  **App configs:** Create `.env` file in `./`

   -  `NUMBER_OF_WORKERS`: number of workers in Docker Swarm. Default is `2`.

   Example:

   ```sh
   # .env
   NUMBER_OF_WORKERS=2
   ```

You can also check out the file `.env.example` to see all required environment variables.

> **Note**: If you want to use this example environment, you need to rename it to `.env`.

# :rocket: Usage

## :desktop_computer: Create Docker VPS

```sh
docker run -d --privileged --hostname <hostname> --name <container_name> docker:dind
```

## :chains: Create Docker Swarm

### Way 1: Using Shell script to auto create `Swarm`

```sh
bash bootstrap.sh
```

### Way 2: Manually create `Swarm`

Start the init DinD container

```sh
docker run -d --privileged --hostname <hostname_1> --name <container_1> docker:dind
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
docker run -d --privileged --hostname <hostname_n> --name <container_n> docker:dind

# Join swarm
docker exec -it <container_n> docker swarm join --token <token> <manager-ip>:<manager-port>
```

> **Note:** If you want to attach and control this container, you can use the following command:
> `docker exec -it <container_n> /bin/sh`

# :building_construction: Practice

You can you can refer to [Docker Swarm lab](https://github.com/QuanBlue/Docker-practice-lab/tree/master/Intermediate/2.%20docker%20swarm/Lab%20%231%3A%20Init%20and%20Manage%20Docker%20Swarm) to create Docker Swarm.

# :world_map: Roadmap

-  [x] Create Docker VPS
-  [x] Create Docker Swarm
   -  [x] Using Shell script
   -  [x] Manually

# :busts_in_silhouette: Contributors

<a href="https://github.com/QuanBlue/Linux-Bootstrap/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=QuanBlue/Linux-Bootstrap" />
</a>

Contributions are always welcome!

# :sparkles: Credits

-  [Docker](https://www.docker.com/)
-  [Docker-in-docker](https://hub.docker.com/_/docker)
-  Emojis are taken from [here](https://github.com/arvida/emoji-cheat-sheet.com)

# :scroll: License

Distributed under the MIT License. See <a href="../LICENSE">`LICENSE`</a> for more information.

# :link: Related Projects

-  <u>[**Docker practice lab**](https://github.com/QuanBlue/Docker-practice-lab)</u>: Practice Docker with Docker, Docker Swarm,... from beginner to advanced.

---

> Bento [@quanblue](https://bento.me/quanblue) &nbsp;&middot;&nbsp;
> GitHub [@QuanBlue](https://github.com/QuanBlue) &nbsp;&middot;&nbsp; Gmail quannguyenthanh558@gmail.com
