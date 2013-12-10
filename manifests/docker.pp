class docker::install::centos {
  exec { epel:
    command => "rpm -Uvh http://ftp.riken.jp/Linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm",
    creates => "/etc/yum.repos.d/epel.repo",
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
  }

  package { 'docker-io':
    ensure => present,
    require => Exec[epel],
  }
}

class docker::install {
  # support CentOS alone
  include install::centos
}

class docker::service {
  service { docker:
    ensure => running,
  }
}

class docker {
  include install
  include service
  Class[install] -> Class[service]
}
