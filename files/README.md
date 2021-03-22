## Infrastructure

A collection of playbooks for infrastructure provisioning, configuration, applications and services. Utilizes a
containerized shell environment for dependency consistency. Includes both ansible and terraform binaries.

### Documentation

- [Infrastructure Docs](docs/README.md) - runbooks, modules, etc.
- [OPS Tools](https://github.com/typecoercion/docker-ops-tools) - bootstrap, `.tfconfig.yml` `.tfvars.jsonnet`

### Required Dependencies

- [blackbox](https://github.com/StackExchange/blackbox)
- [brew](https://brew.sh/)
- [direnv](https://direnv.net)
- [docker](https://www.docker.com)
- [git](https://git-scm.com/)
- [jsonnet](https://jsonnet.org/)

Use make to install the system dependencies; script only works with macOS.

    # checks and installs brew and dependencies
    make setup-mac

This repository utilizes `direnv` for initializing local variable exports and path integration. You may choose between
an operating environment that executes commands within a docker container, or a helper that will shim dependencies on
the host machine. Although the docker abstraction is not required, it makes things easier and has fewer dependencies.

#### Use Docker Setup

    # use docker environment
    make use-docker

#### Initialize Environment

    # initialize .env file with instructions
    make setup-env

    # initialize terraform credentials
    terraform login

    # fetch dependencies and decrypt files
    make install

---

### Secret Access

Follow the [blackbox](https://github.com/StackExchange/blackbox) documentation for updating the GPG keyring. Here are
the quick instructions for adding an additional public key.

    # grant admin access to secrets
    gpg --homedir .blackbox --no-default-keyring --import .blackbox/keys/*.asc
    GPG="gpg --no-default-keyring" blackbox_update_all_files
