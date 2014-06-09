require 'spec_helper'

#################################
#
#          Swift Base
#
#################################

describe user('swift') do
  it { should exist }
end

describe group('swift') do
  it { should exist }
end

describe file('/etc/swift') do
  it { should be_directory }
  it { should be_grouped_into 'swift' }
end

describe file('/var/lib/swift') do
  it { should be_directory }
  it { should be_grouped_into 'swift' }
end

describe file('/var/run/swift') do
  it { should be_directory }
  it { should be_grouped_into 'swift' }
end
