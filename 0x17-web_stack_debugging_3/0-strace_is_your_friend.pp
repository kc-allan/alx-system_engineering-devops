class strace_apache {
  package { 'strace':
    ensure => installed,
  }

  package { 'apache2':
    ensure => installed,
  }

  service { 'apache2':
    ensure => running,
    enable => true,
  }

  file { '/etc/apache2/apache2.conf':
    owner => 'root',
    group => 'root',
    mode => '644',
    notify => Service['apache2'],
  }

  file { '/etc/apache2/mods-enabled/rewrite.load':
    owner => 'root',
    group => 'root',
    mode => '644',
    notify => Service['apache2'],
  }

  exec { 'strace_apache':
    command => '/usr/bin/strace -p $(pgrep -f apache) -o /tmp/strace.log',
    user   => 'root',
    require=> Package['strace'],
  }

  file { '/etc/apache2/sites-available/default':
    owner   => 'root',
    group   => 'root',
    mode   => '644',
    content =>
      "ServerName localhost\n" +
      "ProxyPass / http://127.0.0.1:8080/\n" +
      "ProxyPassReverse / http://127.0.0.1:8080/\n",
  }
}
