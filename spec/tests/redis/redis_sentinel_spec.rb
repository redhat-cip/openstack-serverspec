require 'spec_helper'

#
# cloud::database::nosql::redis::sentinel
#

describe port(26379) do
  it { should be_listening.with('tcp') }
end

describe file('/bin/redis-notifications.sh') do
  it { should be_file }
end
