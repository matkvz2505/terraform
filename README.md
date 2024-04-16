### Install terraform

Prerequisites

Documentation
    https://developer.hashicorp.com/terraform/downloads

Before installing Terraform, you should have the following prerequisites installed on your Linux machine:

```bash

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform

```
MacOS

```bash

brew tap hashicorp/tap

brew install hashicorp/tap/terraform

```

### Install tfenv

tfenv is a tool that allows you to easily switch between different versions of the Terraform machine learning framework on your local machine. It provides a simple command-line interface for managing Terraform versions.

```bash
git clone https://github.com/tfutils/tfenv.git ~/.tfenv

echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc

tfenv --version

tfenv install 1.5.1

tfenv use 1.5.1

```

## Create a path tmp in root directory

```bash

mkdir tmp

```

## Configure your AWS access keys

```bash

aws configure --profile <profile_name>

terraform init --upgrade

terraform workspace select <stage>

STAGE=$(terraform workspace show) && echo $STAGE

```


### Create a file called <stage>.tfvars for storing sensitive data.
```bash

STAGE          = ""
region         = ""
project        = ""

aws_account_id = ""

AWS_ACCESS_KEY = ""
AWS_SECRET_KEY = ""

```
### Planning

This will check the current configuration against the remote Infrastructure and identify any changes that need to be made. Double check this plan and make *sure* the changes look correct. If you're not sure, ask somebody.

```bash
terraform plan -out tmp/${STAGE}.plan -var-file="${STAGE}.tfvars"
```

### Applying changes

This will make the changes shown in the plan. Submit a pull request before applying changes.

```bash

terraform apply tmp/${STAGE}.plan

```