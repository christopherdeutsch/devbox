case node['platform']
  when 'debian'
    node['devbox']['packages']['debian']['virtualbox'].each do |pkg|
      package pkg
    end

  when 'mac_os_x'
    dmg_package 'VirtualBox' do
      source node['devbox']['packages']['mac_os_x']['virtualbox']
      action :install

  end
end
