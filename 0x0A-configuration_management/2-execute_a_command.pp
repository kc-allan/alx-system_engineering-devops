# Kills the process called killmenow
exec { 'killmenow_process':
command     => '/usr/bin/pkill -f killmenow',
refreshonly => true,
}
