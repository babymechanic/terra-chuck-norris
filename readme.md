# terra chuck

Creates a VPC in your account and sets up the following:

- VPC
    - ECR repo
    - private s3 bucket
    - public subnet (in two availability zones)
        - internet gateway
        - nat gateway
        - app load balancer
    - private subnet (in two availability zones)
        - ECS setup with Fargate

# steps to run

- ensure you have logged into aws cli
- deploy the common infra by
    - running `terraform apply` from `deployments/dev/common_infra`
- build and push image to ecr (it currently reads `s3://dev-chuck-norris/chuck-norris.txt` which you might need to
  change as buckets names are globally unique)
    - run `docker build -t chuck-norris .` from `s3-reader` folder
    - follow steps
      to [tag this image and push to ecr](https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-ecr-image.html)
- deploy the app
    - update `deployments/dev/chuck_norris_say/main.tf` for s3 bucket and image and tag version
    - running `terraform apply` from `deployments/dev/chuck_norris_say`
- you should now be able to view the content of the text file by performing a `GET` on the ALB root route
