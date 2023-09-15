resource "aws_iam_role" "test_role" {
    count = length(var.role_name)
  name =var.role_name[count.index]
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        # Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    owner = "rakesh"
  }
}

#create 2nd resouse aws_instance
resource "aws_instance" "rakesh_test" {
    for_each = toset(var.set)
    ami = "ami-05dbd1926bfb06723"
    instance_type = "t2.micro"
    subnet_id = "subnet-0962069167a59d185"
    tags = {
        name=each.value
        owner="rakesh.kumar01@cloudeq.com"
    }
    volume_tags = {
      name=each.key
      owner="rakesh.kumar01@cloudeq.com"
    }
  
}
# output "instance_type" {
    
  
# }
