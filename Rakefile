require 'rspec/core/rake_task'

desc "boostrap everything"
task :bootstrap => [:chefdk, :install]

desc "run devbox chef recipes"
task :install do
  $PATH = "/opt/chefdk/bin:#{$PATH}"
  sh "sudo rm -f cookbooks || true"
  sh "berks vendor"
  sh "sudo chef-client -z -j zero.json -c zero.rb"
end

desc "(re)install chefdk"
task :chefdk do
  Dir.chdir('/tmp') do
    url = 'https://packages.chef.io/stable/debian/8/chefdk_0.17.17-1_amd64.deb'
    sh "wget --no-clobber #{url}"
    sh "sudo dpkg -i *.deb"
  end
end

desc "run some tests"
task :test do
  sh "chef exec rspec"
end
