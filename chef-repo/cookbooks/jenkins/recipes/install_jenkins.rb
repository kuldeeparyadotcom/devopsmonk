#
# Cookbook Name:: jenkins
# Recipe:: install_jenkins 
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
# ports to be opened 8080, 50000 in chefdemo-sg security group

directory 'jenkins_home_mount_point' do
  path node.default['jenkins']['jenkins_home_mount_point']
  owner 'ec2-user'
  group 'ec2-user'
  mode '0777'
  action :create
end

bash 'install jenkins' do
  cwd "/tmp"
  name = node.default['jenkins']['jenkins_container_name']
  jenkins_home_mount = node.default['jenkins']['jenkins_home_mount_point']
  slave_agent_port = node.default['jenkins']['slave_agent_port']
  admin_console_port = node.default['jenkins']['admine_console_port']
  code <<-EOH
    docker run --name #{name} -p #{admin_console_port}:8080 -v #{jenkins_home_mount}:/var/jenkins_home -p #{slave_agent_port}:50000 -d jenkins 
  EOH
end
