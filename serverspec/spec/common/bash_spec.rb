require 'spec_helper'

class Bash
    VERSION = '4.1.2'
    RELEASE = '29.el6'
end

describe package('bash') do
    it { should be_installed.with_version(Bash::VERSION + '-' + Bash::RELEASE) }
end
