# Last version

- pvergain/python_ldap:3.9.1-slim-buster

# Pour la construction de l'image

$ make login
docker login
Authenticating with existing credentials...
WARNING! Your password will be stored unencrypted in /home/pvergain/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded

$ make push
docker push pvergain/python_ldap:3.9.1-slim-buster
The push refers to repository [docker.io/pvergain/python_ldap]
9b5f7999314e: Pushed
9f886c65c87a: Mounted from library/python
3a00c899bb1f: Mounted from library/python
298944d68297: Mounted from library/python
daf898595055: Mounted from library/python
87c8a1d8f54f: Mounted from library/python
3.9.1-slim-buster: digest: sha256:3ed7d39063bdaf1874c098d9f33a61a5e779b77691c92a48bb6feea87ba97864 size: 1582



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
image: pvergain/python_ldap:3.9.0-slim-buster

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


