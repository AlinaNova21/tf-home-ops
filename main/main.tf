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

data "sops_file" "secrets" {
  source_file = "secrets.sops.yaml"
}

resource "github_actions_secret" "tf_api_token" {
  repository       = github_repository.tf_home_ops.name
  secret_name      = "TF_API_TOKEN"
  plaintext_value  = data.sops_file.secrets.data.terraform_token
}

locals {
  github_actions_variables = {
    "TF_CLOUD_ORGANIZATION": "Whoverse"
    "TF_WORKSPACE": "tf-home-ops"
    "CONFIG_DIRECTORY": "./"
  }
}
resource "github_actions_variable" "tf_workspace" {
  for_each = local.github_actions_variables
  repository       = github_repository.tf_home_ops.name
  variable_name    = each.key
  value            = each.value
}