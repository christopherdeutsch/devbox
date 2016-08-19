require 'chefzero_simple/rake/task'

# $PATH = "/opt/chefdk/bin:#{$PATH}"

desc "boostrap everything"
task :bootstrap => [:chefdk, :install]

desc "run devbox chef recipes"
task :install => [:fix_perms] do
  Rake::Task[:local_chefzero].invoke
  puts "Now you probablly need to logout and re-login to get rbenv up and running"
end

desc "(re)install chefdk"
task :chefdk do
  chefdk_url = `grep chefdk_url attributes/default.rb | cut -d'=' -f2`.chomp
  Dir.chdir('/tmp') do
    sh "wget --no-clobber #{chefdk_url}"
    sh "sudo dpkg -i *.deb"
  end
end

task :fix_perms do  
  #
  # FIXME: the chef run messes up file ownership, so just rechown here
  #
  chown_user = `grep 'user.* =' attributes/default.rb | cut -d'=' -f2`.chomp
  sh "sudo chown -R #{chown_user} berks-cookbooks cookbooks || true"
end

desc "run some tests"
task :test => [:fix_perms] do
  sh "chef exec rspec"
end
