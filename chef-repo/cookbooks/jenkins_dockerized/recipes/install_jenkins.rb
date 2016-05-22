#
# Cookbook Name:: jenkins_dockerized
# Recipe:: install_jenkins
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#Get data from S3 bucket (jenkins_home in tar.gz format)
remote_file "#{node.default['docker']['user_home']}/jenkins_home.tar.gz" do
  source 'https://s3-us-west-1.amazonaws.com/kuldeeparya.com/manual_backups/jenkins_home.tar.gz'
  owner "#{node.default['docker']['user']}"
  group "#{node.default['docker']['user']}"
  mode '0755'
  action :create
  not_if { ::Dir.exist?("#{node.default['jenkins_dockerized']['jenkins_home']}") }
end

#Untar
#This should run only once at the time of first time set up
execute 'prepare_jekins_home_content_first_time' do
  command "tar zxvf jenkins_home.tar.gz"
  cwd "#{node.default['docker']['user_home']}"
  user "#{node.default['docker']['user']}"
  group "#{node.default['docker']['user']}"
  not_if { ::Dir.exist?("#{node.default['jenkins_dockerized']['jenkins_home']}") }
end

#jenkins_home should have been created so far by tar command
#Purpose of below directory resource is only to manage permissions, ownership and group settings
directory "#{node.default['jenkins_dockerized']['jenkins_home']}" do
  owner "#{node.default['docker']['user']}"
  group "#{node.default['docker']['user']}"
  mode '0755'
  action :create
  recursive true
end


execute 'remove_existing_jenkins_container' do
  command "docker rm -f #{node.default['jenkins_dockerized']['container_name']}"
  cwd "#{node.default['docker']['user_home']}"
  only_if { container_name = `docker ps -a --format "{{.Names}}"`; container_name.split.include?("#{node.default['jenkins_dockerized']['container_name']}") }
end

#Read data bag users
#specifically jenkins data bag item
#get value of uid from there to use with docker run command
jenkins_uid = data_bag_item('users', 'jenkins')['uid']

execute 'spinup_jenkins_container' do
  command "docker run -u #{jenkins_uid} --name #{node.default['jenkins_dockerized']['container_name']} -p #{node.default['jenkins_dockerized']['admin_port']}:8080 -p #{node.default['jenkins_dockerized']['slave_port']}:50000 -v #{node.default['jenkins_dockerized']['jenkins_home']}:/var/jenkins_home --env JAVA_OPTS=-Dhudson.footerURL=#{node.default['jenkins_dockerized']['java_opts_dhudson_footerurl']} -d #{node.default['jenkins_dockerized']['image_name']}:#{node.default['jenkins_dockerized']['image_tag']}"
  cwd "#{node.default['docker']['user_home']}"
  not_if { container_name = `docker ps -a --format "{{.Names}}"`; container_name.split.include?("#{node.default['jenkins_dockerized']['container_name']}") }
end
