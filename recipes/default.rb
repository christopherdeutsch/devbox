#
# Cookbook Name:: devbox
# Recipe:: default
#
# Copyright (C) 2016 Christopher Deutsch
#
include_recipe 'devbox::directories'
include_recipe 'devbox::packages'
include_recipe 'devbox::ruby'
include_recipe 'devbox::git'

#
# these are special case installs
#
include_recipe 'devbox::virtualbox'
include_recipe 'devbox::docker'
