#
# Cookbook Name:: user_runit
# Recipe:: default
#
# Copyright 2012, Jeff Siegel
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe "runit"

node['user_runit']['services'].each do |service|
  user = service['user']
  sv_dir = service['sv_dir'] || node['user_runit']['sv_dir']
  service_dir = service['service_dir'] || node['user_runit']['service_dir']

  directory "/home/#{user}/#{sv_dir}" do
    owner user
    group user
    action :create
  end

  directory "/home/#{user}/#{service_dir}" do
    owner user
    group user
    action :create
  end

  directory "/var/log/runsvdir-#{user}" do
    owner user
    group user
    action :create
  end

  runit_service "runsvdir-#{user}" do
    template_name "user"
    options "user" => user
  end
end
