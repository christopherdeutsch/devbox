#
# basic git setup
#
bash 'set git username and email' do
  code <<-EOH
    git config --global user.name #{node['devbox']['name']}
    git config --global user.email #{node['devbox']['email']}
  EOH
end
