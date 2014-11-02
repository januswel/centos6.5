require 'spec_helper'

%w(
  mongodb-org
  mongodb-org-server
  mongodb-org-mongos
  mongodb-org-shell
  mongodb-org-tools
).each do |name|
  describe package(name) do
    it { should be_installed }
  end
end

describe service('mongod') do
  it { should be_enabled }
  it { should be_running }
end

# MongoDB should have a user "root"
describe command("mongo admin -u root -p root --eval 'quit();'") do
  its(:exit_status) { should eq 0 }
end
