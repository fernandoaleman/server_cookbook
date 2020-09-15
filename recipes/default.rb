package 'epel-release'

build_essential 'server'

package node['server']['packages']

package node['server']['remove_packages'] do
  action :remove
end
