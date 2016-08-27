describe 'devbox::virtualbox' do
  context 'debian' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.automatic['platform'] = 'debian'
        node.normal['devbox']['packages']['debian']['virtualbox'] = %w(virtualbox1 virtualbox2)
      end.converge(described_recipe)
    end

    it 'installs virtualbox' do
      expect(chef_run).to install_package('virtualbox1')
      expect(chef_run).to install_package('virtualbox2')
    end
  end

  context 'mac_os_x' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.automatic['platform'] = 'mac_os_x'
        node.normal['devbox']['packages']['mac_os_x']['virtualbox'] = 'http://example.com/virtualbox_uri'
      end.converge(described_recipe)
    end

    it 'installs virtualbox' do
      expect(chef_run).to install_dmg_package('VirtualBox').with(
        source: 'http://example.com/virtualbox_uri'
      )
    end
  end

end
