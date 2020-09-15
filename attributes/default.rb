default['server']['packages'] = %w(htop ncdu the_silver_searcher)
default['server']['remove_packages'] = %(sendmail)
default['server']['bash_aliases'] = {
  'll' => 'ls -alhH --color=auto',
}
default['server']['timezone'] = 'UTC'
default['server']['history_time_format'] = '%Y-%m-%d_%H:%M:%S'
default['server']['ssh_known_hosts'] = %w(github.com)
default['server']['default_editor'] = 'vim'
