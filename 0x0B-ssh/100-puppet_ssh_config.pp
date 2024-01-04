# # Sets up client config file for ssh

file { '/etc/ssh/ssh_config':
  ensure  => present,
  content => "Host 100.26.170.211\n\tPasswordAuthentication no\n\tIdentityFile ~/.ssh/school\n",
}
