describe 'devbox::directories' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }
  
  %w(/home/cdeutsch /home/cdeutsch/src /home/cdeutsch/packages).each do |dir|
    it "creates directory #{dir}" do
      expect(chef_run).to create_directory(dir)
    end
  end
end
