module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = local.cluster_name
  cluster_version = "1.27"
  subnet_ids      = module.vpc.private_subnets
  tags = {
    Name = local.cluster_name
  }
  vpc_id = module.vpc.vpc_id



  eks_managed_node_groups = {
    worker_group_node_one = {
      min_size       = 1
      max_size       = 10
      desired_size   = 1
      instance_types = ["t3.large"]
      security_group = [aws_security_group.worker_group_node_one.id]

    },


    worker_group_node_two = {
      min_size       = 1
      max_size       = 10
      desired_size   = 1
      instance_types = ["t3.large"]
      security_group = [aws_security_group.worker_group_node_two.id]
    }
  }
}