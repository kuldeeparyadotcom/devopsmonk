#
# Cookbook Name:: docker
# Recipe:: install_docker
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#Install docker if it's already not installed

script 'docker_installation' do
  interpreter "bash"
  cwd "/tmp"
  code <<-EOH
   yum -y update
   curl -fsSL https://get.docker.com/ | sh
   service docker start
  EOH
  not_if { ::File.exist?("/usr/bin/docker") }
end

service "docker" do
  action :start
end
