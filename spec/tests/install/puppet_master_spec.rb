require 'spec_helper'

#
# cloud::install::puppetmaster
#

describe port(8140) do
  it { should be_listening.with('tcp') }
end
