locals {
  github_actions_variables = {
    # "TF_CLOUD_ORGANIZATION" = tfe_organization.whoverse.name
    # "TF_WORKSPACES"         = jsonencode(local.workspaces)
    # "CONFIG_DIRECTORY"      = "./"
    TF_LOCAL_WORKSPACES = jsonencode(local.local_workspaces)
  }
  github_actions_secrets = {
    "TF_API_TOKEN"           = data.sops_file.secrets.data.terraform_token
    "SOPS_AGE_KEY"           = data.sops_file.secrets.data.sops_age_key
    "TS_OAUTH_CLIENT_ID"     = data.sops_file.secrets.data.ts_oauth_client_id
    "TS_OAUTH_CLIENT_SECRET" = data.sops_file.secrets.data.ts_oauth_client_secret
  }
}

resource "github_repository" "tf_home_ops" {
  name            = "tf-home-ops"
  description     = "terraform code for my home operations"
  topics          = ["terraform", "home-ops", "gitops"]
  visibility      = "public"
  has_issues      = true
  has_discussions = false
  has_projects    = false
  has_wiki        = false
  is_template     = false
}

resource "github_actions_secret" "tf_api_token" {
  for_each        = local.github_actions_secrets
  repository      = github_repository.tf_home_ops.name
  secret_name     = each.key
  plaintext_value = each.value
}

resource "github_actions_variable" "tf_workspace" {
  for_each      = local.github_actions_variables
  repository    = github_repository.tf_home_ops.name
  variable_name = each.key
  value         = each.value
}
