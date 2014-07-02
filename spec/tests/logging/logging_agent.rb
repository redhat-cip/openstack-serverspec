require 'spec_helper'

#
# cloud::logging::agent
#

describe package('rsyslog') do
  it { should be_installed }
end

describe file('/etc/rsyslog.d/client.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }

  its(:content) { should match /\*\.\* @#{property[:syslog_server]}:#{property[:syslog_port]};RSYSLOG_ForwardFormat/ }
end
