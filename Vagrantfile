
Vagrant.configure(2) do |config|

  # RedHat 6.5
  config.vm.define "redhat", primary: true do |redhat|
    redhat.vm.box = "anandbitra/redhat-6.5"
    redhat.vm.hostname = "redhat-db2"
    redhat.vm.provision "ansible" do |ansible|
      ansible.playbook = "test.yml"
      ansible.sudo = true
      ansible.sudo_user = "root"
      #ansible.tags = "validate"
    end
    redhat.vm.provider "virtualbox" do |v|
        v.customize [ "modifyvm", :id, "--cpus", "1" ]
        v.customize [ "modifyvm", :id, "--memory", "1024" ]
    end
  end
  # Oracle Linux 6.5
  config.vm.define "ol" do |ol|
    ol.vm.box = "terrywang/oraclelinux-6-x86_64"
    ol.vm.hostname = "oraclelinux-db2"
    ol.vm.provision "ansible" do |ansible|
      ansible.playbook = "test.yml"
      ansible.sudo = true
      ansible.sudo_user = "root"
      #ansible.tags = "setup"
    end
    ol.vm.provider "virtualbox" do |v|
        v.customize [ "modifyvm", :id, "--cpus", "1" ]
        v.customize [ "modifyvm", :id, "--memory", "1024" ]
    end
  end
  # Oracle Linux 7
  config.vm.define "ol7" do |ol|
    ol.vm.box = "jhcook/oel7"
    ol.vm.hostname = "oraclelinux7-db2"
    ol.vm.provision "ansible" do |ansible|
      ansible.playbook = "test.yml"
      ansible.sudo = true
      ansible.sudo_user = "root"
      #ansible.tags = "setup"
    end
  end

end
