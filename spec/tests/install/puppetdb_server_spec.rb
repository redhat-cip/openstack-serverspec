require 'spec_helper'

#
# cloud::install::puppetdb::server
#

# PuppetDB running on 127.0.0.1:8080
#
describe port(8080) do
  it { should be_listening }
end

# Vhost used as proxy for PuppetDB
#
describe port(8081) do
  it { should be_listening }
end

# Make sure PostgreSQL is running
#
describe port(5432) do
  it { should be_listening }
end

describe file('/etc/puppet/ssl/puppetdb.pem') do
  it { should be_mode 500 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
