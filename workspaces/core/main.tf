locals {
  workspaces = ["core", "bsky"]
  variables = [
    {
      workspaces = ["core"]
      key        = "SOPS_AGE_KEY",
      value      = data.sops_file.secrets.data.sops_age_key
      sensitive  = true
    },
    {
      workspaces = ["core"]
      key        = "GITHUB_TOKEN",
      value      = data.sops_file.secrets.data.github_token
      sensitive  = true
    },
    {
      workspaces = ["bsky"]
      key        = "CLOUDFLARE_EMAIL",
      value      = data.sops_file.secrets.data.cloudflare_email
      sensitive  = false
    },
    {
      workspaces = ["bsky"]
      key        = "CLOUDFLARE_API_TOKEN",
      value      = data.sops_file.secrets.data.cloudflare_api_token
      sensitive  = true
    },
  ]
  flat_variables = {
    for v in flatten([
      for k, v in local.variables : [
        for w in v.workspaces : {
          key = "${v.key}_${w}",
          index = k
          workspace = w
        }
      ]
    ]) : v.key => {
      index = v.index
      workspace = v.workspace
    }
  }
}

data "sops_file" "secrets" {
  source_file = "secrets.sops.yaml"
}

resource "tfe_organization" "whoverse" {
  name  = "Whoverse"
  email = "ashumann13@gmail.com"
}

resource "tfe_workspace" "whoverse" {
  for_each              = toset(local.workspaces)
  name                  = each.value
  organization          = tfe_organization.whoverse.name
  tag_names             = ["gitops"]
  auto_apply            = true
  file_triggers_enabled = false
  working_directory     = "workspaces/${each.value}/"
}

# resource "tfe_variable_set" "common" {
#   name         = "Common Variables"
#   organization = tfe_organization.whoverse.name
# }

# resource "tfe_workspace_variable_set" "whoverse" {
#   for_each        = local.workspaces
#   variable_set_id = tfe_variable_set.common.id
#   workspace_id    = tfe_workspace.whoverse[each.key].id
# }

resource "tfe_variable" "whoverse" {
  for_each     = local.flat_variables
  key          = local.variables[each.value.index].key
  value        = local.variables[each.value.index].value
  sensitive    = try(local.variables[each.value.index].sensitive, false)
  workspace_id = tfe_workspace.whoverse[each.value.workspace].id
  category     = try(local.variables[each.value.index].category, "env")
}
