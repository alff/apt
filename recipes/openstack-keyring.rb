# Cookbook Name:: apt
# Recipe:: openstack-keyring
#
# Copyright 2013, Mirantis IT
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
#

# Run force update when we use Vagabond test environment
v_run=execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
  action :nothing
end

# Instalation of ubuntu keyring package for Vagabond using
k_pack=package "ubuntu-cloud-keyring" do
  action :nothing
end

v_run.run_action(:run)
k_pack.run_action(:install)
v_run.run_action(:run)
