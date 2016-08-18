#
# Use the rbenv cookbook to set up ruby 
#
include_recipe 'ruby_build::default'
include_recipe 'ruby_rbenv::system'

rbenv_global node['rbenv']['rubies'].first
