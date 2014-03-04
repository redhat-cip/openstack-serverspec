require 'spec_helper'

#
# Glance
#

describe service('glance-api') do
  it { should be_enabled }
  it { should be_running }
end

describe port(9292) do
  it { should be_listening.with('tcp') }
end

describe service('glance-registry') do
  it { should be_enabled }
  it { should be_running }
end

describe port(9191) do
  it { should be_listening.with('tcp') }
end

describe package('glance') do
    it { should be_installed }
end

describe package('python-ceph') do
    it { should be_installed }
end

describe file('/etc/glance/glance.conf') do
  it { should contain "default_store=rbd" }
  it { should contain "rbd_store_pool=images" }
  it { should contain "rbd_store_user=glance" }
  it { should contain "rbd_store_ceph_conf=/etc/ceph/ceph.conf" }
end

describe file('/etc/ceph/ceph.client.glance.keyring') do
  it { should be_owned_by 'glance' }
  it { should be_grouped_into 'glance' }
  it { should be_mode 400 }
end

describe cron do
  it { should have_entry '1 0 * * * glance-cache-cleaner' }
  it { should have_entry '*/30 * * * * glance-cache-pruner' }
end
