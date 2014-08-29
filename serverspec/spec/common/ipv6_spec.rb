require 'spec_helper'

# Check if IPv6 is disabled
describe 'linux kernel parameters' do
  context linux_kernel_parameter('net.ipv6.conf.all.disable_ipv6') do
    its(:value) { should eq 1 }
  end

  context linux_kernel_parameter('net.ipv6.conf.default.disable_ipv6') do
    its(:value) { should eq 1 }
  end
end

describe service('ip6tables') do
  it { should_not be_enabled }
  it { should_not be_running }
end
