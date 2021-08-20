module "common" {
    source = "./modules/common"
    rg_name = "group3-assignment2-rg" 
  
}
module "database" {
    source = "./modules/database" 
    rg1 = "group3-assignment2-rg" 
}
module "linux" {
    source = "./modules/linux"
    rg1 = "group3-assignment2-rg"
    location = "CanadaCentral"
    linux_name = var.linux_name
    subnet_id = [module.network.subnet.id]
    depends_on = [module.resource_group]
}

module "load_balancer" {
    source = "./modules/load_balancer"
    rg1 = "group3-assignment2-rg" 
    # linux_name = var.linux_vms
    public_ip_address_id = [module.linux.linux_public_ip]
    linux_nic = [module.linux.linux_nic]
    subnet_id_lb = [module.network.subnet.id]
    linux_name = var.linux_name 
}
module "network" {
    source = "./modules/network"
    rg_name = "group3-assignment2-rg"
    location = "CanadaCentral" 
}
module "resource_group" {
    source = "./modules/resource_group"
    rg1 = "group3-assignment2-rg"  
}
# module "vmwindows" {
#     source = "./modules/vmwindows"
#     subnet_id = "subnet"
#     rg_name = "group3-assignment2-rg" 
  
# }
