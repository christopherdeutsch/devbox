#
# Use the rbenv cookbook to set up ruby 
#

include_recipe 'ruby_build::default'
ruby_build_ruby node['devbox']['ruby_version']
include_recipe 'ruby_rbenv::user_install'
