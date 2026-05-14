# -----------------------------------
# IAM Access Analyzer Integration
# -----------------------------------

resource "aws_accessanalyzer_analyzer" "main" {
  analyzer_name = "landing-zone-access-analyzer"
  type          = "ACCOUNT"
}