output "central_log_bucket_name" {
  value = aws_s3_bucket.central_logs.id
}

output "central_log_bucket_arn" {
  value = aws_s3_bucket.central_logs.arn
}