
Vagrant.configure(2) do |config|

  # RedHat 6.5
  config.vm.define "redhat", primary: true do |redhat|
    #redhat.vm.box = "anandbitra/redhat-6.5"
    redhat.vm.box = "bernardo_redhat.box"
    redhat.vm.hostname = "redhat"
    redhat.vm.provision "ansible" do |ansible|
<<<<<<< HEAD
      ansible.playbook = "examples/custom_instance.yml"
=======
      ansible.playbook = "examples/docker_test.yml"
>>>>>>> database-support
      ansible.sudo = true
      ansible.sudo_user = "root"
      #ansible.tags = "databases"
    end
    redhat.vm.provider "virtualbox" do |v|
        v.customize [ "modifyvm", :id, "--cpus", "1" ]
        v.customize [ "modifyvm", :id, "--memory", "1024" ]
    end
  end
  # Oracle Linux 6.5
  config.vm.define "ol" do |ol|
    #ol.vm.box = "terrywang/oraclelinux-6-x86_64"
    ol.vm.box = "ol6_bernardo.box"
    ol.vm.hostname = "oraclelinux-db2"
    ol.vm.provision "ansible" do |ansible|
<<<<<<< HEAD
      ansible.playbook = "examples/full_example.yml"
=======
      ansible.playbook = "examples/docker_test.yml"
>>>>>>> database-support
      ansible.sudo = true
      ansible.sudo_user = "root"
      #ansible.tags = "users"
      #ansible.tags = "download"
    end
    ol.vm.provider "virtualbox" do |v|
        v.customize [ "modifyvm", :id, "--cpus", "1" ]
        v.customize [ "modifyvm", :id, "--memory", "1024" ]
    end
  end
  # Oracle Linux 7
  #Note: If you've trouble with this machine, disable USB controller on VirtualBox
  config.vm.define "ol7" do |ol|
    ol.vm.box = "jhcook/oel7"
    ol.vm.hostname = "oraclelinux7-db2"
    ol.vm.provision "ansible" do |ansible|
      ansible.playbook = "examples/full_example.yml"
      ansible.sudo = true
      ansible.sudo_user = "root"
      ansible.tags = "databases"
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
