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

resource "github_branch_default" "tf_home_ops_main" {
  repository = github_repository.tf_home_ops.name
  branch     = "main"
}
