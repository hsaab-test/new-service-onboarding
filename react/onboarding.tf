terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
}

provider "harness" {
  endpoint         = "https://app.harness.io/gateway"
  account_id       = "Dn2AsSxZSmKVAq-WNhAl_w"
  platform_api_key = var.harness_api_key
}

resource "harness_platform_project" "project" {
  identifier = var.project_name
  name       = var.project_name
  org_id     = "default"
  color      = "#0063F7"
}

resource "harness_platform_pipeline" "react_app_pipeline" {
  identifier      = "react_app_pipeline"
  org_id          = "default"
  project_id      = "default_project"
  name            = "react_app_pipeline"
  import_from_git = true

  git_import_info {
    branch_name   = "main"
    file_path     = "react/pipeline.yaml"
    connector_ref = "account.hsaabtest"
    repo_name     = "new-service-onboarding"
  }

  pipeline_import_request {
    pipeline_name        = "react_app_pipeline"
    pipeline_description = "Pipeline Description"
  }
}