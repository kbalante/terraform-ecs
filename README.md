# terraform-ecs
Sets up an ECS cluster with a simple hello world container inside an EC2 instance.

You will need to do the following to get your ECS cluster working:

1. Create an AWS account.
   - https://aws.amazon.com/

2. Install AWS CLI.
   - https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html

3. Log into your AWS account and generate an access key id and secret access key.

4. In a terminal, configure AWS CLI and fill out your access key id and secret access key. 
   
   `aws configure`

5. Install terraform.
   - https://learn.hashicorp.com/terraform/getting-started/install.html

6. Create a new Elastic Container Registry repository.
   - https://us-east-2.console.aws.amazon.com/ecr/repositories?region=us-east-2
   - enter a name for your repository and click on create repository e.g. hello-world
   - take note of the path to the image e.g. XYZ.dkr.ecr.us-east-2.amazonaws.com/hello-world:latest

7. Create a simple docker container and upload it to the ECR registry.
   - https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html

8. Initialize terraform for the first time.
   
   `terraform init`

9. Apply the terraform. This will provision an ECS cluster, an EC2 instance with an ECS agent, an application load 
balancer, a task definition, and an ECS service.
   
   `terraform apply`

10. Go to your AWS Console and search for Elastic Container Service. You should see your newly provisioned ECS Cluster.
    - inside the terraform-ecs-cluster, open up the Tasks tab and click on the running task shown
    - under Containers, select terraform-ecs-container. This will expand the container details
    - copy the external link in your browser to test out the container.
    - you should see Hello World!