require 'spec_helper'

#
# cloud::install::puppetdb::config
#

describe file('/etc/puppet/puppet.conf') do
  it { should be_file }

  it { should contain('storeconfigs = true').from(/^\[main\]/).to(/^\[agent\]/) }
  it { should contain('storeconfigs_backend = puppetdb').from(/^\[main\]/).to(/^\[agent\]/) }
  it { should contain('reports = puppetdb').from(/^\[main\]/).to(/^\[agent\]/) }

end

describe file('/etc/puppet/routes.yaml') do
  it { should be_file }

  it { should contain('apply:') }
  it { should contain('catalog:') }
  it { should contain('terminus: compiler') }
  it { should contain('cache: puppetdb') }
  it { should contain('facts:') }
  it { should contain('terminus: facter') }
  it { should contain('cache: puppetdb_apply') }
end

describe file('/etc/puppet/puppetdb.conf') do
  it { should be_file }
  
  it { should contain('port = 8081') }
  it { should contain("server = #{property[:puppetdb_server]}") }
end
