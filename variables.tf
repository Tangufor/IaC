variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-04835db5f7545f22e", "subnet-000a41021993921dd"]
}

variable "eks_node_group_desired_size" {
  type    = number
  default = 2
}

variable "eks_node_group_max_size" {
  type    = number
  default = 2
}

variable "eks_node_group_min_size" {
  type    = number
  default = 2
}

variable "eks_node_group_role_name" {
  type    = string
  default = "eks-node-group-role"
}

variable "eks_node_group_name" {
  type    = string
  default = "eks-node-group"
}

variable "eks_cluster_name" {
  type    = string
  default = "my-eks"
}

variable "eks_cluster_role_name" {
  type    = string
  default = "cluster-role"
}

variable "ssh_key" {
  type    = string
  default = "kubernetes"
}
