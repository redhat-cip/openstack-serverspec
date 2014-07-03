require 'spec_helper'

#
# cloud::logging::server
#

describe package('td-agent') do
  it { should be_installed }
end

describe package('fluent-elasticsearch-plugin') do
  it { should be_installed.by('gem') }
end

describe file('/var/db/td-agent') do
  it { should be_directory }
  it { should be_owned_by 'td-agent' }
  it { should be_grouped_into 'td-agent' }
end
