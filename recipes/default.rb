#
# Cookbook Name:: gradle-cookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

filename = 'gradle-2.11-bin.zip'
gradle_home = '/opt/gradle'

package 'unzip'

directory gradle_home

remote_file "#{Chef::Config[:file_cache_path]}/#{filename}" do
  source "https://services.gradle.org/distributions/#{filename}"
  backup false
  notifies :run, 'execute[extract_gradle]'
  action :create
end

execute 'extract_gradle' do
  command "unzip #{Chef::Config[:file_cache_path]}/#{filename} -d #{gradle_home}"
  action :nothing
end
