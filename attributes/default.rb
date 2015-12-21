#
# Cookbook Name:: mediawiki_backup
# Attributes:: default
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
#
default['mediawiki_backup']['mailto']          = 'root'
default['mediawiki_backup']['retention_days']  = '8'
default['mediawiki_backup']['backup_name']     = 'wiki_backup'
default['mediawiki_backup']['wiki_dir']        = '/var/www/mediawiki'
default['mediawiki_backup']['wiki_config']     = '/etc/mediawiki'
default['mediawiki_backup']['working_dir']     = '/tmp'
default['mediawiki_backup']['backup_store']    = '/etc/wiki_backup'
default['mediawiki_backup']['ssl_certs']       =
default['mediawiki_backup']['cron']['minute']  = '0'
default['mediawiki_backup']['cron']['hour']    = '23'
default['mediawiki_backup']['cron']['day']     = '*'
default['mediawiki_backup']['cron']['month']   = '*'
default['mediawiki_backup']['cron']['weekday'] = '*'


