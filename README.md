## Requirements ##

* Terraform v0.12 or higher
* Kubectl 1.14 or higher
* Properly configured AWS credentials (i.e. AWS_ACCESS_KEY_ID & AWS_SECRET_ACCESS_KEY env vars)
* aws-iam-authenticator binary (i.e. curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator)

## Instructions ##

* `terraform init`
* `terraform plan` (Terraform will ask the wordpress db password)
* `terraform apply`
* Copy the generated kubeconfig to your .kube directory: `terraform output kubeconfig>~/.kube/config`
* Apply a ConfigMap that allows our ec2 instances in the cluster to communicate with the EKS master, as well as allowing our user account access to run commands against the cluster:
```
terraform output config_map_aws_auth > configmap.yml
kubectl apply -f configmap.yml
```
* Apply yaml files at k8s_ready
```
kubectl apply -f k8s_ready/wordpress_volumeclaim.yaml
kubectl apply -f k8s_ready/wordpress_service.yaml
kubectl apply -f k8s_ready/wordpress_deployment.yaml
```
