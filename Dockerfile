# dockerfile
#
# building the python virtualenv with ldap support
# (we need gcc and libldap2-dev libsasl2-dev libssl-dev)
# https://hub.docker.com/_/python
FROM python:3.9.6-slim-buster as builder

# gcc because we need regex and pyldap
# libldap2-dev because we need pyldap
# + git (git clone) and pandoc
RUN apt-get update \
    && pip install -U pip wheel \
    && apt-get install --no-install-recommends -y gcc libldap2-dev libldap-2.4-2 libsasl2-dev libssl-dev git pandoc  \
    && rm -rf /var/lib/apt/lists/*

# ENV PYTHONUNBUFFERED 1 : this statement means that Docker won’t buffer
# the output from your application; instead, you will get to see your
# output in your console the way you’re used to.
ENV PYTHONUNBUFFERED 1

## for debug purpose if there are problems
CMD ["sleep", "10000000000"]
