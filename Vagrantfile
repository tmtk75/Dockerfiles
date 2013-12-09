Vagrant.configure("2") do |config|
  config.vm.box     = "centos-6.4-x86_64"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box"

  config.vm.provision :shell, :inline => <<-EOH
    sudo yum install -y http://ftp.riken.jp/Linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
  EOH

  config.vm.provision "puppet" do |puppet|
    puppet.options  = "--verbose --debug"
  end
end
