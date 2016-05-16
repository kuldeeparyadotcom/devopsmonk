#
# Cookbook Name:: jenkins_dockerized
# Recipe:: install_jenkins
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory "#{node.default['jenkins_dockerized']['jenkins_home']}" do
  owner "#{node.default['docker']['user']}"
  group "#{node.default['docker']['user']}"
  mode '0777'
  action :create
  recursive true
end

execute 'remove_existing_jenkins_container' do
  command "docker rm -f #{node.default['jenkins_dockerized']['container_name']}"
  cwd "#{node.default['docker']['user_home']}"
  only_if { container_name = `docker ps -a --format "{{.Names}}"`; container_name.split.include?("#{node.default['jenkins_dockerized']['container_name']}") }
end

execute 'spinup_jenkins_container' do
  command "docker run --name #{node.default['jenkins_dockerized']['container_name']} -p #{node.default['jenkins_dockerized']['admin_port']}:8080 -p #{node.default['jenkins_dockerized']['slave_port']}:50000 -v #{node.default['jenkins_dockerized']['jenkins_home']}:/var/jenkins_home --env JAVA_OPTS=-Dhudson.footerURL=#{node.default['jenkins_dockerized']['java_opts_dhudson_footerurl']} -d #{node.default['jenkins_dockerized']['image_name']}:#{node.default['jenkins_dockerized']['image_tag']}"
  cwd "#{node.default['docker']['user_home']}"
  not_if {  }
end
