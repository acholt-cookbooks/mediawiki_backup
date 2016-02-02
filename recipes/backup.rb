#
# Cookbook Name:: mediawiki_backup
# Recipe:: backup
#
# Copyright (C) 2015  Andrew Holt
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

#Cron Values
MINUTE  = "#{node["mediawiki_backup"]["cron"]["minute"]}"
HOUR    = "#{node["mediawiki_backup"]["cron"]["hour"]}"
DAY     = "#{node["mediawiki_backup"]["cron"]["day"]}"
MONTH   = "#{node["mediawiki_backup"]["cron"]["month"]}"
WEEKDAY = "#{node["mediawiki_backup"]["cron"]["weekday"]}"
MAILTO  = "#{node["mediawiki_backup"]["mailto"]}"


directory node['mediawiki_backup']['backup_store'] do
  owner 'root'
  group 'root'
  mode  '0750'
  action :create
end

#Directory doesn't exist on Ubuntu systems
directory '/usr/local/bin' do
  action :create
end

template '/usr/local/bin/mediawiki-backup.sh' do
  source 'mediawiki-backup.erb'
  owner  'root'
  group  'root'
  mode   '0550'
  action :create
end

cron_d 'mediawiki-backup' do
  minute  MINUTE
  hour    HOUR
  day     DAY
  month   MONTH
  weekday WEEKDAY
  mailto  MAILTO
  command '/usr/local/bin/mediawiki-backup.sh'
  user    'root'
end
