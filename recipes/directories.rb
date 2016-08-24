#
# make some directories
#
homedir = case node['platform']
  when 'mac_os_x'
    "/Users/#{node['devbox']['user']}"
  else
    "/home/#{node['devbox']['user']}"
end

directory "#{homedir}/packages"
directory "#{homedir}/src"
