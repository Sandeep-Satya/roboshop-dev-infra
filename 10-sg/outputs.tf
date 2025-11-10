output "sg_id" {
  description = "List of security group IDs"
  value       = module.sg[*].sg_id 
}