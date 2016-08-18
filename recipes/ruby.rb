#
# Use the rbenv cookbook to set up ruby 
#
include_recipe 'ruby_rbenv::system'
include_recipe 'ruby_build::default'

rbenv_global node['rbenv']['rubies'].first
