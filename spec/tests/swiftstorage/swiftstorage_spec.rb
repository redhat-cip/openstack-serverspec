require 'spec_helper'

#################################
#
#         Swift Storage
#
#################################

describe file('/etc/swift/account.ring.gz') do
  it { should be_file }
  it { should be_owned_by 'swift' }
  it { should be_grouped_into 'swift' }
end

describe file('/etc/swift/container.ring.gz') do
  it { should be_file }
  it { should be_owned_by 'swift' }
  it { should be_grouped_into 'swift' }
end

describe file('/etc/swift/object.ring.gz') do
  it { should be_file }
  it { should be_owned_by 'swift' }
  it { should be_grouped_into 'swift' }
end

describe port(6000) do
  it { should be_listening.with('tcp') }
end

describe port(6001) do
  it { should be_listening.with('tcp') }
end

describe port(6002) do
  it { should be_listening.with('tcp') }
end
