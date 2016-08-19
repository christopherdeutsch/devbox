#
# This could be done via https://github.com/chef-cookbooks/docker
# But just for fun since I need the practice...
#

package 'apt-transport-https'

apt_repository 'docker' do
  uri          'https://apt.dockerproject.org/repo'
  distribution 'debian-jessie'
  components   ['main']
  
  key '58118E89F3A912897C070ADBF76221572C52609D'
  keyserver 'p80.pool.sks-keyservers.net'
end

execute 'apt-get update'

package 'docker-engine'
