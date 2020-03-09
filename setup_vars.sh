echo "Generating SSH key..."
rm -f ec2-key*
ssh-keygen -P "" -t rsa -b 4096 -m pem -f ec2-key -q <<< y
chmod 400 ec2-key.pub

echo "Setting up Terraform module..."
cat << EOF > instances.tf 
module "kali" {
  source = "./infrastructure"

  my_ip          = "$(curl -4 -s ifconfig.co)"
  ssh_public_key = "$(cat ec2-key.pub)"
}

output "connection_string" {
  value = module.kali.connection_cmd
}

EOF
