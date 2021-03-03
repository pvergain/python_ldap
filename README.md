Last version
==============

python_ldap on  main [!] via 🐍 v3.9.2
❯ make build
docker build --tag pvergain/python_ldap:3.9.2-slim-buster .
Sending build context to Docker daemon  195.6kB
Step 1/4 : FROM python:3.9.2-slim-buster as builder
 ---> ce689abb4f0d
Step 2/4 : RUN apt-get update     && pip install -U pip wheel     && apt-get install --no-install-recommends -y gcc libldap2-dev libldap-2.4-2 libsasl2-dev libssl-dev     && rm -rf /var/lib/apt/lists/*
 ---> Using cache
 ---> 937359780858
Step 3/4 : ENV PYTHONUNBUFFERED 1
 ---> Using cache
 ---> 36528b5ea352
Step 4/4 : CMD ["sleep", "10000000000"]
 ---> Using cache
 ---> e5c482716cc5
Successfully built e5c482716cc5
Successfully tagged pvergain/python_ldap:3.9.2-slim-buster

python_ldap on  main [!] via 🐍 v3.9.2
❯ make login
docker login
Authenticating with existing credentials...
WARNING! Your password will be stored unencrypted in /home/pvergain/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded

python_ldap on  main [!] via 🐍 v3.9.2
❯ make push
docker push pvergain/python_ldap:3.9.2-slim-buster
The push refers to repository [docker.io/pvergain/python_ldap]
a4d863a16950: Pushed
fe796314f3f4: Mounted from library/python
a642096e6e01: Mounted from library/python
b327e713d8e9: Mounted from library/python
c38160dfb10e: Mounted from library/python
9eb82f04c782: Mounted from library/python
3.9.2-slim-buster: digest: sha256:84c0c17b2b1bb51d5ef484aab7c20a1637d61ab713502bed22494fbdcc3c7d14 size: 1582


Used by
=========

- tuto_django
- intranet_doc


Exemple for building a Django + LDAP sphinx documentation with gitlab

```yaml
---
# .gitlab-ci.yml
# ===============
#
# Creating and Tweaking GitLab CI/CD for GitLab Pages
# ----------------------------------------------------
#
# - https://gitlab.com/help/user/project/pages/getting_started_part_four.md
#
# hub docker
# -----------
#
# - https://hub.docker.com/repository/docker/pvergain/python_ldap
#
image: pvergain/python_ldap:3.9.2-slim-buster

pages:
  stage: deploy
  script:
  - pip install -r requirements.txt
  # http://www.sphinx-doc.org/en/master/usage/quickstart.html
  - sphinx-build -d _build/doctrees . _build/html
  - mv _build/html public
  artifacts:
    paths:
    - public
  only:
  - master
```

# github python_ldap

Dockerfile with Python + gcc + LDAP

- https://github.com/pvergain/python_ldap

# Docker Hub

- https://hub.docker.com/repository/docker/pvergain/python_ldap

# Dockerfile

- https://github.com/pvergain/python_ldap/blob/main/Dockerfile

# Makefile

- https://github.com/pvergain/python_ldap/blob/main/Makefile

# .pre-commit-config.yaml

- https://github.com/pvergain/python_ldap/blob/main/.pre-commit-config.yaml


