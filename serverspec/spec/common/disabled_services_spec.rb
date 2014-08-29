require 'spec_helper'

# daemons
%w(
  auditd
  lvm2-monitor
  postfix
  rpcbind
  rpcgssd
).each do |name|
  describe service(name) do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

# utility scripts
%w(
  blk-availability
  udev-post
).each do |name|
  describe service(name) do
    it { should_not be_enabled }
  end
end
