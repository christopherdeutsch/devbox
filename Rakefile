require 'chefzero_simple/rake/task'

desc "boostrap everything"
task :bootstrap => [:chefdk, :install]

desc "run devbox chef recipes"
task :install do
  Rake::Task[:chefzero_simple].invoke
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

desc "run some tests"
task :test do
  sh "chef exec rspec"
end
