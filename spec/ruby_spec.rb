describe 'devbox::ruby' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }
  
  #it "creates directory #{pkg}" do
  #  expect(chef_run).to install_package(pkg)
  #end
end
