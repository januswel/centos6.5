require 'spec_helper'

VERSION = '1.0.1e'
RELEASE = '30.el6.8'

describe package('openssl') do
  it { should be_installed.with_version(VERSION + '-' + RELEASE) }
end
