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
  platform_api_key = "pat.Dn2AsSxZSmKVAq-WNhAl_w.67366e6e7025915fa2f815d1.JDcs3FyLosDsDL0RDUiR"
}

resource "harness_platform_project" "test" {
  identifier = "testproject"
  name       = "Test Project"
  org_id     = "org_id"
  color      = "#0063F7"
}

resource "harness_platform_pipeline" "new_service_pipeline" {
  identifier      = "new_service_pipeline"
  org_id          = "default"
  project_id      = "default_project"
  name            = "new_service_pipeline"
  import_from_git = true

  git_import_info {
    branch_name   = "main"
    file_path     = "react/pipeline.yaml"
    connector_ref = "account.hsaabtest"
    repo_name     = "new-service-onboarding"
  }

  pipeline_import_request {
    pipeline_name        = "new_service_pipeline"
    pipeline_description = "Pipeline Description"
  }
}