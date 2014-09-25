require 'spec_helper'

#
# cloud::monitoring::server
#

describe package('sensu') do
  it { should be_installed }
end

# sensu-api
describe port(4567) do
  it { should be_listening.with('tcp') }
end

# uchiwa (sensu-dasbhoard)
describe port(3000) do
  it { should be_listening.with('tcp') }
end

# redis
describe port(6379) do
  it { should be_listening.with('tcp') }
end


