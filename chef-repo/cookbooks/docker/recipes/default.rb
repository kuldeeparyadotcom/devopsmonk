#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'docker::install_docker'
include_recipe 'docker::create_user'
include_recipe 'docker::add_user_to_docker_group'
