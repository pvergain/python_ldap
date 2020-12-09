# Last version

- pvergain/python_ldap:3.9.0-slim-buster


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


