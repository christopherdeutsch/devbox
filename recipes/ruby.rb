#
# Use the rbenv cookbook to set up ruby, if possible
#
case node['platform']
  when 'mac_os_x'
    package 'ruby-build'
    package 'rbenv'
  else
    include_recipe 'ruby_build::default'
    include_recipe 'ruby_rbenv::system'
end
