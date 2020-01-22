FROM thomasweise/docker-texlive-full:latest
MAINTAINER TJ Maynes <tj@tjmaynes.com>

RUN apt-get update
RUN apt-get install -f -y \
    git \
    make

ENTRYPOINT ["make"]
