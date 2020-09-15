default['server']['packages'] = %w(htop ncdu the_silver_searcher)
default['server']['remove_packages'] = %(sendmail)
default['server']['bash_aliases'] = {
  'll' => 'ls -alhH --color=auto',
}
default['server']['timezone'] = 'UTC'
