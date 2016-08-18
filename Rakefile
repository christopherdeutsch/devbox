desc "boostrap everything"
task :bootstrap => [:chefdk, :install]

desc "run devbox chef recipes"
task :install do
  $PATH = "/opt/chefdk/bin:#{$PATH}"
  
  #
  # FIXME: the chef run messes up file ownership, so just rechown here
  #
  chown_user = `grep 'user.* =' attributes/default.rb | cut -d'=' -f2`.chomp
  sh "sudo chown -R #{chown_user} berks-cookbooks cookbooks"

  sh "berks vendor"
  sh "sudo chef-client -z -j zero.json -c zero.rb"
  
  puts "Now you probablly need to logout and re-login to get rbenv up and running"
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
