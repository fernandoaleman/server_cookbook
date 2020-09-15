package 'epel-release'

build_essential 'server'

package node['server']['packages']

package node['server']['remove_packages'] do
  action :remove
end

node['server']['bash_aliases'].each do |bash_alias, alias_value|
  replace_or_add "alias #{bash_alias}" do
    path '/etc/bashrc'
    line "alias #{bash_alias}='#{alias_value}'"
  end
end

timezone node['server']['timezone']

template '/etc/profile.d/history_time_format.sh' do
  cookbook 'server'
  source 'env.sh.erb'
  variables 'env_vars' => {
              'histtimeformat' => node['server']['history_time_format'],
            }
end

package 'openssh-clients'

node['server']['ssh_known_hosts'].each do |ssh_known_host|
  ssh_known_hosts_entry ssh_known_host
end

template '/etc/profile.d/editor.sh' do
  cookbook 'server'
  source 'env.sh.erb'
  variables 'env_vars' => {
              'editor' => node['server']['default_editor'],
              'visual' => node['server']['default_editor'],
            }
end
