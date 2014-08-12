require 'spec_helper'

NTP_PORT = 123

describe package('ntp') do
  it { should be_installed }
end

describe service('ntpd') do
  it { should be_enabled }
  it { should be_running }
end

describe port(NTP_PORT) do
  it { should be_listening }
end
