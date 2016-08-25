describe 'devbox::directories' do
  [
    ['unix', 'home'],
    ['mac_os_x', 'Users']
  ].each do |platform, dir_prefix|
    context platform do
      let(:chef_run) do
        ChefSpec::ServerRunner.new do |node|
          node.automatic['platform'] = platform
          node.normal['devbox']['user'] = 'user'
        end.converge(described_recipe)
      end

      %w(src packages).each do |dir|
        it "creates directory #{dir}" do
          expect(chef_run).to create_directory("/#{dir_prefix}/user/#{dir}")
        end
      end
    end
  end
end

