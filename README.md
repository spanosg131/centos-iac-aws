# centos-iac-aws
CentOS 8 based Docker image with common IaC tools and AWS CLI. The purpose image is to keep a consistent environment accross multiple systems.

## Tools Included
* Ansible
* AWS CLI version 2
* HashiCorp Terraform

## Image Build
If your are building the image for the first time
```
docker build . -t centos-iac-aws:1.0.0
```
## Creating a Container
### Basic Execution
```
docker run -it --rm -v /path/to/project:/target/path centos-iac-aws:1.0.0
```
### Sample Shell Alias
```
alias iac-aws="docker run -it --rm -v $(pwd):/working_project centos-iac-aws:1.0.0"
```