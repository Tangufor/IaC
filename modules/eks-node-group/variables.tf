variable "subnet_ids" {
  type = list(string)
}

variable "desired_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "eks_node_group_role_name" {
  type = string
}

variable "eks_node_group_name" {
  type = string
}

variable "eks_cluster_name" {
  type = string
}

variable "ssh_key" {
  type = string
}
