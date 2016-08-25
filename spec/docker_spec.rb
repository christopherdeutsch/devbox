describe 'devbox::docker' do
  context 'debian' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.automatic['platform'] = 'debian'
        node.normal['devbox']['packages']['debian']['docker'] = 'docker_pkg'
      end.converge(described_recipe)
    end

    it 'adds docker apt repo' do
      expect(chef_run).to add_apt_repository('docker').with(
        uri: 'https://apt.dockerproject.org/repo'
      )
    end

    it 'runs apt-get update' do
      expect(chef_run).to run_execute('apt-get update')
    end

    it 'installs docker package' do
      expect(chef_run).to install_package('docker_pkg')
    end
  end

  context 'mac_os_x' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.automatic['platform'] = 'mac_os_x'
        node.normal['devbox']['packages']['mac_os_x']['docker']   = 'docker_package_url'
      end.converge(described_recipe)
    end

    it 'installs docker' do
      expect(chef_run).to install_dmg_package('Docker').with(
        source: 'docker_package_url'
      )
    end
  end

end
