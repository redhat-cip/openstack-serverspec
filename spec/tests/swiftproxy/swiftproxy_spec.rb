require 'spec_helper'

#################################
#
#         Swift API
#
#################################

describe file('/etc/swift/proxy-server.conf') do
  it { should be_owned_by 'swift' }
  it { should be_grouped_into 'swift' }
  it { should be_mode 660 }
end

describe port(8080) do
  it { should be_listening.with('tcp') }
end
