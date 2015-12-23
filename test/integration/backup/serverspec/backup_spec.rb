require 'spec_helper'

describe 'mediawiki_backup::backup' do

  %w{/usr/local/bin /etc/wiki_backup}.each do |dir|
    describe file dir do
      it { should be_directory           }
      it { should be_owned_by     'root' }
      it { should be_grouped_into 'root' }
      case dir
        when '/usr/local/bin'
          it { should be_mode     '755'  }
        when '/etc/wiki_backup'
          it { should be_mode     '750'  }
      end
    end
  end

  describe file('/usr/local/bin/mediawiki-backup.sh') do
    it { should be_file }
    it { should be_owned_by     'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode         '550'  }
  end

  %w{
    BACKUPNAME='wiki_backup'
    WORKINGDIR="/tmp/\$BACKUPNAME"
    WIKIDIR='/var/www/mediawiki'
    WIKICONFIG='/etc/mediawiki'
    BACKUPSTORE='/etc/wiki_backup'
    RETENTION_DAYS='8'
    SSLCERTS='/etc/pki/tls/certs/server.crt /etc/pki/tls/private/server.key'
  }.each do |script|
    describe file('/usr/local/bin/mediawiki-backup.sh') do
      its(:content) { should match script }
    end
  end

  describe file('/etc/cron.d/mediawiki-backup') do
    it { should contain '0 23 * * * root /usr/local/bin/mediawiki-backup.sh'  }
  end

end
