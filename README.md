## OPS Tools

Opinionated tooling for maintaining terraform repository, module structures, and variables.

- Uses direnv and docker for command isolation
- Uses ansible to generate terraform consistently between modules
- Uses jsonnet for variable inheritance and configuration

#### Bootstrap Repository

This will interactively sync files to a repository to support the aforementioned setup.

```shell
docker run -it -v $(pwd):/app ghcr.io/typecoercion/ops-tools:0.2.20 bootstrap
```

---

#### Terraform Config

##### .tfconfig.yml

All properties are optional, and will produce output in `generated.tf` based on the sections specified. i.e. if you
don't want to use the generated providers, then just omit the `providers` property.

```yaml
# random workspace key
id: <12 character UID only for TFE workspaces>

# generated backend
backend:
  operations: true

# generated providers
providers:
  ansiblevault:
  aws: <optional version override>

# generated variables
variables:

# vault keys:
vault:
  SLACK_WEBHOOK_URL:
```

##### .tfvars.jsonnet

Global configuration `config/config.jsonnnet` can be imported alongside `..` relative imports.

```jsonnet
local ENV = 'sandbox';

local config  = import 'config.jsonnet';
local inherit = import '../.tfvars.jsonnet'; inherit+

{
  aws_profile: config.aws[ENV].profile,
  aws_region:  config.aws[ENV].region,
  env:         ENV,
}
```

---

#### Terraform Commands

##### tfconfig

Run in-scope of a specific module or across the repository. Will produce a `generated.tf` file based on the
specifications `.tfconfig.yml` file in each module.

##### tfvars

Run in-scope of a specific module or across the repository. Will produce a `.auto.tfvars.json` files based on the
variables and inheritance in `.tfvars.jsonnet` file in each module.

##### tfvault

Run in-scope of a specific module to edit encrypted variables to a `.vault.yml` file. Requires the `ansiblevault`
provider in the example above. The the `vault` property to consistently generate data resources.

---

#### Additional Tools

Install tool versions via [asdf-vm](https://asdf-vm.com/) plugins. Terraform and Packer are included.

```dockerfile
FROM ghcr.io/typecoercion/ops-tools:0.2.20
RUN asdf install packer 1.7.0
RUN asdf install terraform 0.14.7
```
