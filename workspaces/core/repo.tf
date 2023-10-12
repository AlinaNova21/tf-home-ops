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
  repository      = github_repository.tf_home_ops.name
  secret_name     = "TF_API_TOKEN"
  plaintext_value = data.sops_file.secrets.data.terraform_token
}

locals {
  github_actions_variables = {
    "TF_CLOUD_ORGANIZATION" : tfe_organization.whoverse.name
    "TF_WORKSPACES" : jsonencode(local.workspaces)
    "CONFIG_DIRECTORY" : "./"
  }
}
resource "github_actions_variable" "tf_workspace" {
  for_each      = local.github_actions_variables
  repository    = github_repository.tf_home_ops.name
  variable_name = each.key
  value         = each.value
}
