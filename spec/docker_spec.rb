describe 'devbox::docker' do
  context 'debian' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.automatic['platform'] = 'debian'
        node.normal['devbox']['packages']['debian']['docker'] = %w(docker_pkg)
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
        node.normal['devbox']['packages']['mac_os_x']['docker']   = 'http://example.com/docker_package_url'
      end.converge(described_recipe)
    end

    it 'downloads docker' do
      expect(chef_run).to create_remote_file('docker.pkg').with(
        source: 'http://example.com/docker_package_url'
      )
    end

    it 'installs docker' do
      expect(chef_run).to run_execute('install docker').with(
        command: "installer -pkg docker.pkg -target /"
      )
    end
  end

end
