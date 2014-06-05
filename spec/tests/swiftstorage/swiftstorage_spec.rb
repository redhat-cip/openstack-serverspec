require 'spec_helper'

#################################
#
#         Swift Storage
#
#################################

describe port(6000) do
  it { should be_listening.with('tcp') }
end

describe port(6001) do
  it { should be_listening.with('tcp') }
end

describe port(6002) do
  it { should be_listening.with('tcp') }
end
