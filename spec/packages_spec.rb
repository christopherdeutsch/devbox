describe 'devbox::packages' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }
  
  %w(joe build-essential rbenv ruby-build ssl-cert).each do |pkg|
    it "creates directory #{pkg}" do
      expect(chef_run).to install_package(pkg)
    end
  end
end
