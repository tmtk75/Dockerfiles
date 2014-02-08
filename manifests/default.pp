include docker

file { "/home/vagrant/.bashrc":
  ensure => present,
  content => "
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi
alias docker=\"sudo docker\"
"
}
