
Vagrant.configure(2) do |config|

  # RedHat 6.5
  config.vm.define "redhat", primary: true do |redhat|
    redhat.vm.box = "anandbitra/redhat-6.5"
    redhat.vm.hostname = "redhat-db2"
    #redhat.vm.network "private_network", ip: "10.0.2.15"
    redhat.vm.provision "ansible" do |ansible|
      ansible.playbook = "examples/custom_instance.yml"
      ansible.sudo = true
      ansible.sudo_user = "root"
      #ansible.tags = "parse"
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
      #ansible.playbook = "test.yml"
      ansible.playbook = "examples/custom_instance.yml"
      ansible.sudo = true
      ansible.sudo_user = "root"
      #ansible.tags = "parse"
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
      ansible.extra_vars = {
        yum_repo: "http://public-yum.oracle.com/public-yum-ol7.repo"
      }
    end
  end
  # Ubuntu 14
  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/trusty64"
    ubuntu.vm.hostname = "ubuntu-db2"
    ubuntu.vm.network "public_network", ip: "192.168.0.20"
    ubuntu.vm.provision "ansible" do |ansible|
      ansible.playbook = "examples/test_ubuntu.yml"
      ansible.sudo = true
      ansible.sudo_user = "root"
      ansible.tags = "parse"
    end
  end

end
