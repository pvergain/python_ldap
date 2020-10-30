# dockerfile_dev
# Development environment
#
# 2 stages:
#
# - first stage
#       building the python virtualenv with ldap support
#       (we need gcc and libldap2-dev libsasl2-dev libssl-dev)
# - second stage
#       - install the ldap libraries
#
##### Start stage 1 : building the Python virtual environment ##########
# https://hub.docker.com/_/python
FROM python:3.9.0-slim-buster as builder

# gcc because we need regex and pyldap
# libldap2-dev because we need pyldap
RUN apt-get update \
    && apt-get install --no-install-recommends -y gcc libldap2-dev libsasl2-dev libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# we need the bash shell for the 'source' binary
SHELL ["/bin/bash", "-c"]
WORKDIR /opt/docker/
COPY ./requirements.txt .
RUN python -m venv .venv && \
    source .venv/bin/activate && \
    pip install -U pip wheel && \
    pip install -r requirements.txt

#### Start stage 2 #########################################

FROM python:3.9.0-slim-buster as deployer

# ajout d'informations à l'image pour pouvoir l'identifier plus facilement
LABEL maintainer="pvergain@pm.me"
LABEL description="Python + LDAP + djnago"

WORKDIR /opt/docker/
COPY --from=builder /opt/docker/.venv ./.venv

# we only need  the ldap libraries
# https://packages.debian.org/fr/jessie/libldap-2.4-2
RUN apt-get update \
    && apt-get install --no-install-recommends -y tree libldap-2.4-2 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean


# ENV PYTHONUNBUFFERED 1 : this statement means that Docker won’t buffer
# the output from your application; instead, you will get to see your
# output in your console the way you’re used to.
ENV PYTHONUNBUFFERED 1

## End stage 2 #########################################

ADD start.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]

## for debug purpose if there are problems
# CMD ["sleep", "10000000000"]
