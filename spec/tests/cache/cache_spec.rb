require 'spec_helper'

#
# cloud::cache
#

describe package('memcached') do
  it { should be_installed }
end

# (spredzy) TODO: chkconfig is not
# available anymore for systemd
# aware daemon. Upgrade to
# serverspec 2.0 needs to be planned
#describe service('memcached') do
#  it { should be_enabled }
#  it { should be_running }
#end

describe port(11211) do
  it { should be_listening.with('tcp') }
  it { should be_listening.with('udp') }
end

# TODO: check for RAM usage < 60%
