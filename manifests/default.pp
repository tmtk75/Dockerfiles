package {
  [
    'curl',
    'unzip',
    'git',
    'docker-io',
    ]:
  ensure => present,
}

service { docker:
  ensure => running,
  require => Package["docker-io"],
}
