## used in vagrant
exec { epel:
  command => "rpm -Uvh http://ftp.riken.jp/Linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm",
  creates => "/etc/yum.repos.d/epel.repo",
  path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
}

package {
  [
    'curl',
    'unzip',
    'git',
    'docker-io',
    ]:
  ensure => present,
  require => Exec[epel],
}

service { docker:
  ensure => running,
  require => Package["docker-io"],
}
