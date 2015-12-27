MediaWiki Backup Cookbook
===========================
This cookbook will backup a standalone MediaWiki server.

It will deploy a script and populate cron.d to execute it.

Attributes
----------

* `node['mediawiki_backup']['mailto']`          - Email address for notifications. Default is root
* `node['mediawiki_backup']['retention_days']`  - Number of days to keep backups. Default is an 8 day rotation.
* `node['mediawiki_backup']['backup_name']`     - Name of the backup Tar file. Default is wiki_backup.
* `node['mediawiki_backup']['wiki_dir']`        - Location of the MediaWiki directory. Default is '/var/www/mediawiki'.
* `node['mediawiki_backup']['wiki_conf']`       - Location of the MediaWiki configuration. Default is '/etc/mediawiki'.
* `node['mediawiki_backup']['ssl_certs']`       - Locations of the Apache SSL Certs. Default is in EL '/etc/pki/tls/private/server.key', '/etc/pki/tls/certs/server.crt'.
* `node['mediawiki_backup']['working_dir']`     - Temporary working directory. Default is '/tmp'.
* `node['mediawiki_backup']['backup_store']`    - Which directory to store backups '/etc/wiki_backup'.
* `node['mediawiki_backup']['cron']['minute']`  - The minute at which the cron entry should run (0 - 59). Default value: *
* `node['mediawiki_backup']['cron']['hour']`    - The hour at which the cron entry is to run (0 - 23). Default value: 23
* `node['mediawiki_backup']['cron']['day']`     - The day of month at which the cron entry should run (1 - 31). Default value: *
* `node['mediawiki_backup']['cron']['month']`   - The month in the year on which a cron entry is to run (1 - 12). Default value: *
* `node['mediawiki_backup']['cron']['weekday']` - The day of the week on which this entry is to run (0 - 6), where Sunday = 0. Default value: *


Usage
-----
Set up the MediaWiki server backup attributes in a role. For example create a role called
wikiserver.json the is applied to all MediaWiki standalone server.

```json
{
    "name": "wikiserver",
    "description": "Role applied to MediaWiki Servers",
    "chef_type": "role",
    "json_class": "MediaWiki::Role",
    "default_attributes": {
      "mediawiki_backup": {
        "mailto": "backup@example.com",
        "retention_days": "8"
        "ssl_certs": [
          "/etc/pki/tls/private/server.key",
          "/etc/pki/tls/certs/server.crt"
        ]
      }
    },
    "run_list": ["mediawiki_backup"]
}
```


License and Authors
-------------------
- Author:: Andrew Holt

```text
Copyright (C) 2015  Andrew Holt

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
```

### [Wiki Page](https://github.com/acholt-cookbooks/mediawiki_backup/wiki)
