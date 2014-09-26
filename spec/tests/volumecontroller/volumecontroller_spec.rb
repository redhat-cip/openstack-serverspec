require 'spec_helper'

#
# cloud::volume::controller
#

describe port(8776) do
  it { should be_listening.with('tcp') }
end

describe file('/etc/cinder/cinder.conf') do
  it { should contain 'glance_request_timeout=10' }
end

#
# cloud::volume::storage
#

# when ceph is enabled, ensure we have the ceph keyring installed
describe command("bash -c 'if grep -q volume_backend_name=ceph /etc/cinder/cinder.conf; then test -f /etc/ceph/ceph.client.cinder.keyring; fi'") do
  it { should return_exit_status 0 }
end

#
# cloud::volume
#

describe file('/etc/cinder/cinder.conf') do
  it { should contain "notification_driver=cinder.openstack.common.notifier.rpc_notifier" }
end

describe command("cinder --os-username #{property[:ks_user_name]} --os-password #{property[:ks_user_password]} --os-tenant-name #{property[:ks_tenant_name]} --os-auth-url #{property[:endpoint_proto]}://#{property[:vip_public]}:5000/v2.0 list") do
  it { should return_exit_status 0 }
end
