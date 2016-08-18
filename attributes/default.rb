#
# attributes
#
# just assume user already exists as part of basic OS install
#
default['devbox']['user']  = 'cdeutsch'
default['devbox']['email'] = 'chef@ispeakdeutsch.com'
default['devbox']['name']  = 'Chris Deutsch'

#
# chefdk
#
default['devbox']['chefdk_url'] = 'https://packages.chef.io/stable/debian/8/chefdk_0.17.17-1_amd64.deb'

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
default['rbenv']['rubies'] = ['2.2.0']
