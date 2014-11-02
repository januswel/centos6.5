require 'spec_helper'

describe command('which man') do
  its(:exit_status) { should eq 0 }
end
