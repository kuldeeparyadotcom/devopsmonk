#
# Cookbook Name:: mydocker
# Recipe:: setup_priority_user 
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user 'priority' do
  comment 'priority app user'
  home '/home/priority'
  shell '/bin/bash'
  password 'priority'
  notifies :run, 'bash[grant sudo access]', :immediately
end

bash 'grant sudo access' do
  code <<-EOH
    gpasswd -a priority wheel
    echo "priority       ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
  EOH
  action :nothing
end
