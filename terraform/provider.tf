# Configure the OpenStack Provider
provider "openstack" {
    domain_name = "default"
    user_name  = "admin"
    tenant_name = "admin"
    password  = "admin123"
    auth_url  = "https://10.246.151.33:6100/v3"
    insecure = true
}
