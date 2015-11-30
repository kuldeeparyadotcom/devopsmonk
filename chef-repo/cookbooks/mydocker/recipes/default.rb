#
# Cookbook Name:: mydocker
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'mydocker::installation'
include_recipe 'mydocker::install_and_start'
include_recipe 'mydocker::pull_mysql_56_image'
include_recipe 'mydocker::spin_containers'
include_recipe 'mydocker::install_git'
include_recipe 'mydocker::clone_git'
include_recipe 'mydocker::build_phpapache_image'
include_recipe 'mydocker::build_Priority_web_container'
