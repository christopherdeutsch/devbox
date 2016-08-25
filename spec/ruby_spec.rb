describe 'devbox::ruby' do
  #
  # UNIX tests
  #
  context 'unix-like system' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.automatic['platform'] = 'something_unixy'
      end.converge(described_recipe)
    end

    before do
      allow_any_instance_of(Chef::Recipe).to receive(:include_recipe)
    end

    it 'installs ruby-build' do
      expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('ruby_build::default')
      chef_run
    end

    it 'installs rbenv' do
      expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('ruby_rbenv::system')
      chef_run
    end

  end

  #
  # MacOS X tests
  #
  context 'mac_os_x' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.automatic['platform'] = 'mac_os_x'
      end.converge(described_recipe)
    end

    %w(ruby-build rbenv).each do |pkg|
      it "installs #{pkg}" do
        expect(chef_run).to install_package(pkg)
      end
    end
  end

end
