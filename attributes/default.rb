#
# attributes
#
# just assume user already exists as part of basic OS install
#
default['devbox']['user']  = 'cdeutsch'
default['devbox']['email'] = 'chef@ispeakdeutsch.com'
default['devbox']['name']  = 'Chris Deutsch'

#
# some extra packages to install
#
default['devbox']['packages']['debian']['editor']     = %w(joe)
default['devbox']['packages']['debian']['build']      = %w(build-essential ssl-cert)
default['devbox']['packages']['debian']['misc']       = %w(nmap apt-transport-https)
default['devbox']['packages']['debian']['docker']     = %w(docker-engine)
default['devbox']['packages']['debian']['virtualbox'] = %w(virtualbox)


default['devbox']['packages']['mac_os_x']['editor']   = %w(joe)
default['devbox']['packages']['mac_os_x']['build']    = %w()
default['devbox']['packages']['mac_os_x']['misc']     = %w(autoconf wget)

default['devbox']['packages']['mac_os_x']['docker']     = 'https://github.com/docker/toolbox/releases/download/v1.12.0/DockerToolbox-1.12.0.pkg'
default['devbox']['packages']['mac_os_x']['virtualbox'] = 'http://download.virtualbox.org/virtualbox/5.1.4/VirtualBox-5.1.4-110228-OSX.dmg'


#
# ruby
#
default['rbenv']['rubies'] = ['2.2.0']

