
# 1. The Internal Nginx Server (The "Secret")
resource "aws_instance" "internal_app" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t3.micro"
  subnet_id     = data.aws_subnets.private.ids[0]

  tags = { Name = "hidden-nginx-service" }
}

# 2. The NLB (The "Bridge")
resource "aws_lb" "internal_nlb" {
  name               = "sanmi-internal-provider-nlb"
  internal           = true 
  load_balancer_type = "network"
  subnets            = data.aws_subnets.private.ids
}