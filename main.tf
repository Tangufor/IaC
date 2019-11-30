resource "random_string" "eks_name_suffix" {
  length  = 5
  special = false
  upper   = true
  lower   = false
}

resource "random_string" "eks_node_group_suffix" {
  length  = 5
  special = false
  upper   = true
  lower   = false
}

locals {
  group_name   = "${var.eks_node_group_name}-${random_string.eks_node_group_suffix.result}"
  cluster_name = "${var.eks_cluster_name}-${random_string.eks_name_suffix.result}"
}

module "eks_cluster" {
  source                = "./modules/eks-cluster"
  subnet_ids            = var.subnet_ids
  eks_cluster_name      = local.cluster_name
  eks_cluster_role_name = "${local.cluster_name}-${var.eks_cluster_role_name}"
}

module "eks_node_group" {
  source                   = "./modules/eks-node-group"
  ssh_key                  = var.ssh_key
  subnet_ids               = var.subnet_ids
  eks_node_group_name      = local.group_name
  eks_node_group_role_name = "${local.group_name}-${var.eks_node_group_role_name}"
  eks_cluster_name         = module.eks_cluster.name
  desired_size             = var.eks_node_group_desired_size
  min_size                 = var.eks_node_group_min_size
  max_size                 = var.eks_node_group_max_size
}
