require 'spec_helper'

VERSION = '1.0.1e'
RELEASE = '16.el6_5.14'

describe package('openssl') do
  it { should be_installed.with_version(VERSION + '-' + RELEASE) }
end
