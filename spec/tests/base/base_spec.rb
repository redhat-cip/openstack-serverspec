require 'spec_helper'

#
# cloud::init
#

describe port(22) do
  it { should be_listening.with('tcp') }
end
