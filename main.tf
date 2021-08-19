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
    subnet_id = [module.network.subnet.id]  
}

module "load_balancer" {
    source = "./modules/load_balancer"
    rg1 = "group3-assignment2-rg" 
    public_ip_address_id = [module.linux.linux_public_ip]
    linux_nic = [module.linux.linux_nic]   
  
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
