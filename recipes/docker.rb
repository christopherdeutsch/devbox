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

    node['devbox']['packages']['debian']['docker'].each do |pkg|
      package pkg
    end

  #
  # MacOS X
  #
  when 'mac_os_x'
    remote_file 'docker.pkg' do
      source node['devbox']['packages']['mac_os_x']['docker']
    end

    execute 'install docker' do
      command "installer -pkg docker.pkg -target /"
    end
end
