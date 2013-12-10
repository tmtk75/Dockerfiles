class vagrant {
  include vagrant::install::centos
}

class vagrant::install::centos {
  $rpm_url = "https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.0_i686.rpm"
  exec { vagrant:
    command => "rpm -Uvh ${rpm_url}",
    creates => "/usr/bin/vagrant",
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
  }
}

include vagrant
