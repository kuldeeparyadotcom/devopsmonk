#
# Cookbook Name:: docker
# Recipe:: add_user_to_docker_group
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#This recipe add defined user to docker group so that sudo is not required in oder to execute docker commands
#If user is already member of group docker then it does not do anything
#If user does not exist, then also it does not take any action

user=node.default['docker']['user']
execute "add_user_to_docker_group" do
  command "sudo usermod -aG docker #{user}"
  not_if { str = `id -Gn "#{user}"`; str.split.include?("docker") }
  only_if { str = `cat /etc/passwd | grep "#{user}"`; str.split(":").first == "#{user}" }
end
