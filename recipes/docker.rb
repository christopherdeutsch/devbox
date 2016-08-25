#
# install docker
#
case node['platform']
  #
  # Debian
  #
  when 'debian'
    apt_repository 'docker' do
      uri          'https://apt.dockerproject.org/repo'
      distribution 'debian-jessie'
      components   ['main']

      key '58118E89F3A912897C070ADBF76221572C52609D'
      keyserver 'p80.pool.sks-keyservers.net'
    end

    execute 'apt-get update'
    package node['devbox']['packages']['debian']['docker']

  #
  # MacOS X
  #
  when 'mac_os_x'
    dmg_package 'Docker' do
      source node['devbox']['packages']['mac_os_x']['docker']
      action :install
    end

  else
    raise "unsupported platform"
end
