output "vapp_name" {
  description = "The name of the created vApp."
  value       = vcd_vapp.test-2.name
}

output "vapp_id" {
  description = "id of the created vApp"
  value       = vcd_vapp.test-2.id
}

output "vm_name" {
  description = "The name of the created VM."
  value       = vcd_vapp_vm.test_vm.name
}

output "vm_id" {
  description = "The unique ID of the created VM."
  value       = vcd_vapp_vm.test_vm.id
}

output "vm_ip_address" {
  description = "The IP address of the VM."
  value       = vcd_vapp_vm.test_vm.network[0].ip
}

output "vm_status" {
  description = "The current status of the VM."
  value       = vcd_vapp_vm.test_vm.status_text
}