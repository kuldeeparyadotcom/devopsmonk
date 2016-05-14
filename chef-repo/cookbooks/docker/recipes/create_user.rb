#
# Cookbook Name:: docker
# Recipe:: create_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#This recipe creates a user with name, home, and shell defined in attributes file
#It does not take any action if user already exists
#It reloads ohai in order to get user effective in the same chef run

ohai 'reload_passwd' do
  action :nothing
  plugin 'etc'
end

user=node.default['docker']['user']
user_home=node.default['docker']['user_home']
user_shell=node.default['docker']['user_shell']

execute 'create_user' do
  command "sudo useradd -md #{user_home} -s #{user_shell} #{user}"
  only_if "node['etc']['passwd'][#{user}]"
  notifies :reload, 'ohai[reload_passwd]', :immediately
end
