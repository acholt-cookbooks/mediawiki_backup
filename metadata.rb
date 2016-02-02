name             'mediawiki_backup'
maintainer       'Andrew Holt'
maintainer_email 'andrew@theholts.org'
license          'GNU Public License 3.0'
description      'Installs/Configures mediawiki_backup'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.3'

%w{ centos redhat }.each do |osel|
  supports osel, '>= 5.0'
end
supports 'ubuntu', '>= 12.04'

source_url 'https://github.com/acholt-cookbooks/mediawiki_backup'
issues_url 'https://github.com/acholt-cookbooks/mediawiki_backup/issues'

depends 'cron', '~> 1.7.0'
