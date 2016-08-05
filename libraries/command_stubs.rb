if defined?(ChefSpec)
  ChefSpec::Macros.stub_command('which nginx').and_return('/usr/sbin/nginx')
  ChefSpec::Macros.stub_command('test -d /etc/php5/fpm/pool.d || mkdir -p /etc/php5/fpm/pool.d').and_return(0)
end
