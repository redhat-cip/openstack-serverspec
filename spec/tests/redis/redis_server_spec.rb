require 'spec_helper'

#
# cloud::database::nosql::redis::server
#

describe port(6379) do
  it { should be_listening.with('tcp') }
end
