require 'spec_helper'

#################################
#
#         Ceph RBD pool
#
#################################

describe command('ceph osd dump') do
  its(:stdout) { should match /pool . 'data'/ }
end

describe command('ceph osd dump') do
  its(:stdout) { should match /pool . 'rbd'/ }
end

describe command('ceph osd dump') do
  its(:stdout) { should match /pool . 'metadata'/ }
end

describe command('ceph osd dump') do
  its(:stdout) { should match /pool . 'volumes'/ }
end

describe command('ceph osd dump') do
  its(:stdout) { should match /pool . 'images'/ }
end
