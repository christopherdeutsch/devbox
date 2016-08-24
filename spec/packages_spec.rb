describe 'devbox::packages' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.automatic['platform'] = 'platform'
      node.normal['devbox']['packages']['platform']['editor']     = %w(editor_pkg)
      node.normal['devbox']['packages']['platform']['build']      = %w(build_pkg)
      node.normal['devbox']['packages']['platform']['misc']       = %w(misc_pkg)
    end.converge(described_recipe)
  end

  it 'installs editor packages' do
    expect(chef_run).to install_package('editor_pkg')
  end

  it 'installs build packages' do
    expect(chef_run).to install_package('build_pkg')
  end

  it 'installs misc packages' do
    expect(chef_run).to install_package('misc_pkg')
  end
end
