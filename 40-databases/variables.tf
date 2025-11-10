variable "project_name" {
    default = "roboshop"
}
variable "environment" {        
    default = "dev"
}

variable "sg_names" {
    default = [
        #data bases
        "mongodb", "redis", "rabbitmq", "mysql",
        #frontend service
        "frontend", 
        #backend services
        "cart", "catalogue", "user", "payment", "shipping",
        #bastion
        "bastion",
        #load balancer - frontend
        "frontend_alb",
        #backend alb
        "backend_alb"

    ]
}

