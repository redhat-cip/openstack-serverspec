require 'spec_helper'

#
# cloud::install::puppetdb_server
#

describe port(8081) do
  it { should be_listening.with('tcp') }
end
