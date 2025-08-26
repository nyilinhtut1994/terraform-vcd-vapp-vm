
# Terraform-vcd-vapp-vm

This repository contains a Terraform configuration for deploying a vApp and a VM into a VMware Cloud Director (VCD) environment. The project demonstrates the use of Infrastructure as Code (IaC) to automate the provisioning of a virtual machine from a catalog template, and configure a static IP address.

This solution is designed to provide a repeatable and consistent deployment process, reducing manual effort and minimizing configuration drift.

## Features

* Automated vApp Creation: Deploys a vApp and a single VM from a specified catalog template.

* Network Integration: Connects the VM to an existing Organization VDC network.

* Static IP Configuration: Assigns a static IP address to the VM's network interface.

* Repeatable & Consistent: Ensures every deployment is identical, eliminating manual errors.


## Prerequisites

Before you can use this configuration, you must have the following:

* Terraform: [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).

* VMware Cloud Director Environment: Access to a VCD instance with a configured VDC and a VM template available in a catalog.

* VCD Provider Credentials: Your VCD username, password, organization, and VDC.

* ```terraform-provider-vcd``` Plugin: The VMware Cloud Director provider will be automatically downloaded by Terraform when you run ```terraform init```.

## Configuration

The main configuration files are:

* ```variables.tf```: Contains all configurable variables for the deployment, such as vApp name, VM name, and network details.

* ```vm.tf```: This file contains the resource blocks for vcd_vapp and vcd_vapp_vm, which define your infrastructure.

* ```outputs.tf```: Specifies the values to be displayed after a successful deployment, such as the VM's ID and IP address.


## Directory Structure

```javascript
.
├── ansible.cfg               # Ansible configuration file
├── *.yml                     # Playbooks for various services
├── inventory/                # Inventory files defining target hosts
├── templates/                # Jinja2 templates for configuration and environment files
├── vars/                     # Variable files for parameterized configurations
├── id_ed25519 / .pub         # SSH key pair for remote access (keep private key secure)
```


## How to Use

### 1. Clone the Repository:
``` 
    git clone https://github.com/nyilinhtut1994/terraform-vcd-vapp-vm.git
    cd terraform-vcd-vapp-mysql
```

### 2. Rename the variables file:
Rename the ```variables.tf.example``` file to ```variables.tf``` to begin configuring your environment.

```
    mv variables.tf.example variables.tf
```

### 3. Configure Variables:

Open the ```variables.tf``` file and fill in your specific values. Alternatively, you can create a ```terraform.tfvars``` file to store your variables and keep them separate from the main configuration.


### 4. Initialize Terraform:
This command downloads the necessary provider plugins.
```
    terraform init
```

### 5. Review the Plan:
This command shows you what Terraform will create, change, or destroy without actually making any changes.
```
    terraform plan

```

### 6. Apply the Configuration:

This command will provision the vApp and VM in your VCD environment.
```
    terraform apply --auto-approve
```

### 7. View Outputs:

After the ```apply``` is complete, Terraform will display the output values defined in ```outputs.tf```, including the VM's name, ID, and IP address.

