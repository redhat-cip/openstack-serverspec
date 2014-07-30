require 'spec_helper'

#
# cloud::monitoring::agent
#

describe package('sensu') do
  it { should be_installed }
end

describe file('/etc/sensu/conf.d/client.json') do
  it { should be_file }
  it { should be_owned_by 'sensu' }
  it { should be_grouped_into 'sensu' }

end

describe file('/etc/sensu/conf.d/rabbit.json') do
  it { should be_file }
  it { should be_owned_by 'sensu' }
  it { should be_grouped_into 'sensu' }

  its(:content) {
    should match /"host": #{property[:rabbit_host]}/
    should match /"password": #{property[:rabbit_password]}/
  }

end
