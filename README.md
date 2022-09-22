# windows.surrealdb.com

SurrealDB is designed to be simple to install and simple to run - using just one command from your terminal. In addition to traditional installation, SurrealDB can be installed and run with HomeBrew, Docker, or using any other container orchestration tool such as Docker Compose, Docker Swarm, Rancher, or in Kubernetes. Visit the [SurrealDB install page](https://surrealdb.com/install) for more information.

This repository houses the install script located at [windows.surrealdb.com](https://windows.surrealdb.com). It installs the SurrealDB command-line tools and database server,  automatically detecting the host operating platform, and cpu architecture type, and downloading the latest binary for the relevant platform.

If you prefer not using a package manager or Docker, then the easiest and preferred way to get going with SurrealDB is to run one of the following commands in your terminal.


#### Install on Windows

```bash
iwr https://windows.surrealdb.com -useb | iex
```