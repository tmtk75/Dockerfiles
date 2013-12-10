yumrepo { virtualbox:
  descr    => "Oracle Linux / RHEL / CentOS-\$releasever / \$basearch - VirtualBox",
  name     => "virtualbox",
  baseurl  => "http://download.virtualbox.org/virtualbox/rpm/el/\$releasever/\$basearch",
  enabled  => 1,
  gpgcheck => 1,
  gpgkey   => "http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc",
}

$rpm_url = "http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm"
exec { epel:
  command => "rpm -Uvh ${rpm_url}",
  creates => "/etc/yum.repos.d/epel.repo",
  path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
  require => Yumrepo[virtualbox],
}

class virtualbox::dependencies {
  package { [
    "binutils",
    "gcc",
    "make",
    "patch",
    "libgomp",
    "glibc-headers",
    "glibc-devel",
    "kernel-headers",
    "kernel-devel",
    "dkms",
    ]:
    ensure  => present,
    require => Exec[epel],
  }
}

include virtualbox::dependencies

package { "VirtualBox-4.3":
  ensure => present,
  require => Class[virtualbox::dependencies],
}
