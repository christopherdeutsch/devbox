#
# set up chefdk in path
# I don't want to bother to manage a bashrc template
#
ruby_block 'prepend chefdk to path' do
  block do
    path_line = 'export PATH=/opt/chefdk/bin:$PATH'
    bashrc = Chef::Util::FileEdit.new("#{node['devbox']['homedir']}/.bashrc")
    bashrc.insert_line_if_no_match(/^export PATH=\/opt\/chefdk/, path_line)
    bashrc.write_file 
  end
end
