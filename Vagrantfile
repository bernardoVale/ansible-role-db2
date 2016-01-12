
Vagrant.configure(2) do |config|
  config.vm.box = "anandbitra/redhat-6.5"
  config.vm.hostname = "redhat-db2"
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.sudo = true
    ansible.sudo_user = "root"
    ansible.tags = "validate"
  end
end
