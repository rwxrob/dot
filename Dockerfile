FROM ubuntu

LABEL MAINTAINER "Rob Muhlestein <rob@rwx.gg>"
LABEL SOURCE "https://github.com/rwxrob/dot"

RUN apt update -y && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:git-core/ppa && \
    apt update -y && apt install -y git sudo curl

COPY Dockerfile install/entrypoint /

ENTRYPOINT ["sh","/entrypoint"]
