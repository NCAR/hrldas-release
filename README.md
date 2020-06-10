# hrldas-release

HRLDAS (High Resolution Land Data Assimilation System) containing the Noah-MP Land Surface Model

Repository branch structure (as of July 27, 2018)

  master: this is the base branch and contains all finalized development before WRF release

  release: branch from master at WRF release intervals; may include important bug fixes after release

Build container with:
    docker build -t hrldas:latest .

Run container to compile with:
    docker run -it --rm --mount type=bind,source=$(pwd),target=/src -w /src/HRLDAS hrldas:latest
