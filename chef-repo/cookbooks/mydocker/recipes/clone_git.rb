#
# Cookbook Name:: mydocker
# Recipe:: clone_git
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

git "/opt/Priority" do
  repository "git://github.com/kuldeeparyadotcom/Priority.git"
  reference "master"
  action :sync
end
