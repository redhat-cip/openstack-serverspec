require 'spec_helper'

#
# nbd : Ensure the ndb kernel module is loaded
#
# To ensure installation is correct the following
# conditions needs to be met :
#

#
# ssh : Ensure the ssh related files are created
#
# To ensure installation is correct the following
# conditions needs to be met :
#
# * directory should be 700
# * files should be 600
# * all should be owned by nova
# * directory '/var/lib/nova/.ssh' must be present
# * file '/var/lib/nova/.ssh/id_rsa' must be present
# * file '/var/lib/nova/.ssh/authorized_keys' must be present
# * file '/var/lib/nova/.ssh/config' must be present
#

describe file('/var/lib/nova/.ssh') do
  it { should be_mode 700 }
  it { should be_owned_by 'nova' }
  it { should be_grouped_into 'nova' }
end

describe file('/var/lib/nova/.ssh/id_rsa') do
  it { should be_mode 600 }
  it { should be_owned_by 'nova' }
  it { should be_grouped_into 'nova' }
end

describe file('/var/lib/nova/.ssh/authorized_keys') do
  it { should be_mode 600 }
  it { should be_owned_by 'nova' }
  it { should be_grouped_into 'nova' }
end

describe file('/var/lib/nova/.ssh/config') do
  it { should be_mode 600 }
  it { should be_owned_by 'nova' }
  it { should be_grouped_into 'nova' }
end

#
# nova::compute : Ensure the nova computes packages
#                 and services installed correctly
#
# To ensure installation is correct the following
# conditions needs to be met :
#
# * 'pm-utils', 'nova-common', 'nova-compute' packages needs to be installed
# * config file '/etc/nova/nova.conf' should match properties
#

describe file('/etc/nova/nova.conf') do
  it { should be_mode 640 }
  it { should be_owned_by 'nova' }

  its(:content) { should match /compute_driver=libvirt\.LibvirtDriver/ }
  its(:content) { should match /virt_type=#{property[:virt_type]}/ }
end

#
# cloud::compute
#

describe file('/etc/nova/nova.conf') do
  its(:content) { should match /^resume_guests_state_on_host_boot=True$/ }
end

# check if QEMU supports RBD (when Nova is using RBD)
describe command("bash -c 'if grep -q images_type=rbd /etc/nova/nova.conf; then qemu-img | grep rbd; fi'") do
  it { should return_exit_status 0 }
end
