output "arn" {
  value = aws_lambda_function.vss.arn
}
output "invoke_arn" {
  value = aws_lambda_function.vss.invoke_arn
}
output "qualified_arn" {
  value = aws_lambda_function.vss.qualified_arn
}
output "qualified_invoke_arn" {
  value = aws_lambda_function.vss.qualified_invoke_arn
}
output "version" {
  value = aws_lambda_function.vss.version
}
output "source_code_size" {
  value = aws_lambda_function.vss.source_code_size
}