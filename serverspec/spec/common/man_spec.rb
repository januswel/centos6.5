require 'spec_helper'

describe command('which man') do
  it { should return_exit_status 0 }
end
