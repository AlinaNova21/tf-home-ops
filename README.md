# Terraform Home Ops
Terraform Home Ops with GitOps

## Design

Current structure is as follows:
```
modules/     Contains modules to be used among workspaces
- Module1/
- Module2/
workspaces/  Primary root workspaces
- core/      Manages this repo and terraform cloud config
- bsky/      Currently manages domain validation for BlueSky
```

## Workspaces

### Core

Manages this repo and Terraform Cloud
Terraform Cloud is configured to point at this repo, a
workspace is created for each workspace folder in this repo.
The configuration uses the VCS integration, directly enabling
Terraform Cloud to run on the repo.

SOPS is used for storing the secrets needed directly inside the
repo, this workspace uses those secrets to configure secrets in
Terraform Cloud.

### BSky

This module manages domain verification dns records for BlueSky

## Bootstrap

```shell
cd workspaces/core
terraform init
terraform apply
```