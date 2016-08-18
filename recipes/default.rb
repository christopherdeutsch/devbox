#
# Cookbook Name:: devbox
# Recipe:: default
#
# Copyright (C) 2016 Christopher Deutsch
#

include_recipe 'devbox::directories'
include_recipe 'devbox::chefdk'
include_recipe 'devbox::packages'
include_recipe 'devbox::ruby'
