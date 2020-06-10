# hrldas-release

HRLDAS (High Resolution Land Data Assimilation System) containing the Noah-MP Land Surface Model

Repository branch structure (as of July 27, 2018)

  master: this is the base branch and contains all finalized development before WRF release

  release: branch from master at WRF release intervals; may include important bug fixes after release

Build default Ubuntu 20.04 container with all dependencies:
    docker build -t hrldas:latest .

Run default Ubuntu 20.04 container to compile with:
    docker run -it --rm --mount type=bind,source=$(pwd),target=/src -w /src/HRLDAS hrldas:latest

Build specific container with:
    export DISTRO_IMAGE=ubuntu DISTRO_IMAGE_VERSION=16.04; docker build --build-arg DISTRO_IMAGE=$DISTRO_IMAGE --build-arg DISTRO_IMAGE_VERSION=$DISTRO_IMAGE_VERSION -t hrldas:$DISTRO_IMAGE-$DISTRO_IMAGE_VERSION -t hrldas:latest .

Run specific Ubuntu/Debian container to compile with:
    export DISTRO_IMAGE=ubuntu DISTRO_IMAGE_VERSION=16.04
    docker run -it --rm --mount type=bind,source=$(pwd),target=/src -w /src/HRLDAS hrldas:$DISTRO_IMAGE-$DISTRO_IMAGE_VERSION
