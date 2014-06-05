require 'spec_helper'

#################################
#
#       Swift Ring Builder
#
#################################

describe file('/etc/swift/account.builder') do
  it { should be_file }
  it { should be_owned_by 'swift' }
  it { should be_grouped_into 'swift' }
end

describe file('/etc/swift/container.builder') do
  it { should be_file }
  it { should be_owned_by 'swift' }
  it { should be_grouped_into 'swift' }
end

describe file('/etc/swift/object.builder') do
  it { should be_file }
  it { should be_owned_by 'swift' }
  it { should be_grouped_into 'swift' }
end

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
