FROM ubuntu:18.04

ARG username=irods-user
ARG userid=1000
ARG groupid=1000

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    wget apt-transport-https gnupg2 ca-certificates

RUN wget -qO - https://packages.irods.org/irods-signing-key.asc | apt-key add - && \
    echo "deb [arch=amd64] https://packages.irods.org/apt/ bionic main" >> /etc/apt/sources.list.d/renci-irods.list

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y irods-icommands && \
    rm -rf /var/lib/apt/lists/*

RUN addgroup --gid ${groupid} irods-user-group && \
    adduser --home /home/${username} --uid ${userid} --gid ${groupid} --disabled-password ${username}

USER ${userid}:${groupid}
WORKDIR /home/${username}

CMD  ["ihelp"]
