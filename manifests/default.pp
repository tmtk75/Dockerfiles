## This manifest is used in vagrant provisioning
package {
  [
    'curl',
    'unzip',
    'git',
    ]:
  ensure => present,
}

import "docker"
include docker
