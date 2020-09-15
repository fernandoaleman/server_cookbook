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
