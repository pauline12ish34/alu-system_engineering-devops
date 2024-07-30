
#fix our stack so that we get to 0
exec { 'fix_file':
  onlyif    => 'test -e /etc/default/nginx',
  command   => 'sed -i "5s/[0-9]\\+/$ (ulimit -n)/" /etc/default/nginx; service nginx restart',
  provider  => shell,
  logoutput => true,
}
