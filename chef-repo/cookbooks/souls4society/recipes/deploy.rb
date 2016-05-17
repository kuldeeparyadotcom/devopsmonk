#
# Cookbook Name:: souls4society
# Recipe:: deploy
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#The purpose of this recipe is to deploy souls4society website
#Step 1: git pull
#Step 2: copy pulled repositories to directory root
#/var/www/souls4society.com/public_html
#/var/www/souls4society.org/public_html
#/var/www/souls4society.net/public_html
#/var/www/souls4society.info/public_html

cloned_dir = File.join(node.default['souls4society']['user_home'], node.default['souls4society']['app_name'])

git node.default['souls4society']['user_home']['app_name'] do
  repository node.default['souls4society']['repository']
  revision node.default['souls4society']['revision']
  action :sync
end

bash 'copy_directory_content' do
  cwd ::File.dirname(node.default['souls4society']['user_home'])
  code <<-EOH
    cp -R "#{cloned_dir}"/* "#{node.default['souls4society']['com']}"
    cp -R "#{cloned_dir}"/* "#{node.default['souls4society']['org']}"
    cp -R "#{cloned_dir}"/* "#{node.default['souls4society']['info']}"
    cp -R "#{cloned_dir}"/* "#{node.default['souls4society']['net']}"
  EOH
end
