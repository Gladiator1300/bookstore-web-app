private_subnets_tag = ["private*"]
aws_region          = "us-east-1"

project_name     = "bookstore"
application_name = "web"
environment      = "qa"
cost_center      = "0023"
owner            = "Hernandez"
operating_system = "Linux"

asg_ssh_key_name = "always-dev-kp"
// subnet_filter_tag = "public"
// iam_instance_profile = "AmazonSSMRoleForInstancesQuickSetup"
asg_instance_type = "t3.medium"
asg_ami_id        = "ami-0c02fb55956c7d316"
asg_elb_listeners = [
  {
    instance_port     = 22
    instance_protocol = "tcp"
    lb_port           = 22
    lb_protocol       = "tcp"
  },
]

elb_healthy_threshold   = 2
elb_unhealthy_threshold = 2
elb_timeout             = 3
elb_interval            = 30
max_size                = 5
min_size                = 1
asg_grace               = 300
health_check_type       = "EC2"
desired_capacity        = 1

asg_block_device_mappings = [
  {
    # Root volume
    device_name = "/dev/xvda"
    no_device   = 0
    ebs = {
      delete_on_termination = true
      encrypted             = true
      volume_size           = 20
      volume_type           = "gp2"
    }
  }
]

// s3_backend_bucket_name = "cloudops-remote-state20210616181255331200000002"
asg_initial_lifecycle_hooks = [
  {
    name                  = "StartupLifeCycleHook"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 120
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    notification_metadata = <<EOF
{
    "status": "Instance launching"
}
EOF
  },
  {
    name                  = "TerminationLifeCycleHook"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 120
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    notification_metadata = <<EOF
{
    "status": "Instance terminating"
}
EOF
  }
]

