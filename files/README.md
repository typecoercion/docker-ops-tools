## Infrastructure

A collection of tool for infrastructure provisioning and configuration. Utilizes a containerized shell environment for
dependency version consistency. Includes `ansible` and `asdf-vm` bootstrap for `terraform` and `packer` binaries.

### Documentation

- [Infrastructure Docs](docs/README.md) - runbooks, modules, etc.
- [OPS Tools](https://github.com/typecoercion/docker-ops-tools) - bootstrap, `.tfconfig.yml` `.tfvars.jsonnet`

### Required Dependencies

- [brew](https://brew.sh/)
- [direnv](https://direnv.net)
- [docker](https://www.docker.com)
- [git](https://git-scm.com/)
- [git-crypt](https://www.agwa.name/projects/git-crypt/)
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

    # fetch dependencies and decrypt files
    make install

---

### Secret Access

Follow the [git-crypt](https://www.agwa.name/projects/git-crypt/) documentation for updating the GPG keyring. Here are
the quick instructions for adding an additional public key.

    # grant public key access to decrypt secrets
    git-crypt add-gpg-user 14C9252E3D21ACBF883F83DBDAD734A092DCC4BD
