require 'spec_helper'

describe port(8004) do
  it { should be_listening.with('tcp') }
end

describe port(8000) do
  it { should be_listening.with('tcp') }
end

describe port(8003) do
  it { should be_listening.with('tcp') }
end
