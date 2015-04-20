# Description

Installs/configures raspberry pi with owncloud

# Requirements

## Platform:

*No platforms defined*

## Cookbooks:

*No dependencies defined*

# Attributes

* `node['chef_pi']['additional_packages']` -  Defaults to `[ ... ]`.
* `node['chef_pi']['ngix']['server-name']` -  Defaults to `example.com`.
* `node['chef_pi']['ngix']['ssl-cert']` -  Defaults to `server.crt`.
* `node['chef_pi']['ngix']['ssl-key']` -  Defaults to `server.key`.
* `node['chef_pi']['ngix']['oc-root']` -  Defaults to `/var/www/owncloud`.

# Recipes

* [chef_pi::default](#chef_pidefault) - Installs/configures raspberry pi

## chef_pi::default

motd stuff

install additional packages

# License and Maintainer

Maintainer:: YOUR_NAME (YOUR_NAME)

Copyright:: YEAR, YOUR_NAME

License:: Apache 2.0

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
