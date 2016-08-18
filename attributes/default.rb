#
# attributes
#
# just assume user already exists as part of basic OS install
#
default['devbox']['user']         = 'cdeutsch'
default['devbox']['ruby_version'] = '2.1.3'

#
# some extra packages to install
# debian/ubuntu centric
#
default['devbox']['packages']['editor']     = %w(joe)
default['devbox']['packages']['build']      = %w(build-essential ssl-cert)

#
# directories
#
default['devbox']['homedir']     = "/home/#{node['devbox']['user']}"
default['devbox']['package_dir'] = "#{node['devbox']['homedir']}/packages"
default['devbox']['src_dir']     = "#{node['devbox']['homedir']}/src"

#
# ruby
#
# default['rbenv']['root_path'] = '/usr/bin/rbenv'
default['rbenv']['user_installs'] = [{ 
  'user' => node['devbox']['user'],
  'rubies' => node['devbox']['ruby_version']
}]
