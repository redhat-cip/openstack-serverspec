require 'spec_helper'

#
# cloud::logging::server
#

describe package('td-agent') do
  it { should be_installed }
end

describe file('/var/db/td-agent') do
  it { should be_directory }
  it { should be_owned_by 'td-agent' }
  it { should be_grouped_into 'td-agent' }
end

describe process('td-agent') do
  it { should be_running }
end

# Kibana
#
describe port(8300) do
  it { should be_listening.with('tcp') }
end

# ElasticSearch
#
describe port(9200) do
  it { should be_listening.with('tcp') }
end

describe port(9300) do
  it { should be_listening.with('tcp') }
end
