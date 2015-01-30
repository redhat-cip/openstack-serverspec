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
