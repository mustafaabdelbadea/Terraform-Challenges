sudo apt update

sudo apt install unzip

wget https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_linux_amd64.zip

unzip terraform_1.1.5_linux_amd64.zip -d /usr/local/bin

terraform -v