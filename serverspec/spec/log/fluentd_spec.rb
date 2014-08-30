require 'spec_helper'

FLUENTD_PORT = 24224

describe package('td-agent') do
  it { should be_installed }
end

describe service('td-agent') do
  it { should be_enabled }
  it { should be_running }
end

describe port(FLUENTD_PORT) do
  it { should be_listening.with('tcp') }
end
