# module "catalogue" {
#     source = "terraform-aws-modules/security-group/aws"

# name   = "${local.comman_name_suffix}-catalogue"
# use_name_prefix = false
# description = "Security group for catalogue with coustom ports "
# vpc_id = data.aws_ssm_parameter.vpc_id.value 

# }



# module "sg" {
#     count = length(var.sg_names)    
#     source = "git::https://github.com/Sandeep-Satya/terraform-aws-sg.git?ref=main" 
#     project_name   = var.project_name
#     environment    = var.environment
#     sg_name        = var.sg_names[count.index]  
#     sg_description = "created for ${var.sg_names[count.index]}"
#     vpc_id         = local.vpc_id
# }

resource "aws_security_group_rule" "backend_alb_bastion" {
    type             = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "laptop_bastion" {
    type             = "ingress"
  security_group_id = local.bastion_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}