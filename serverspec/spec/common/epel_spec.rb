require 'spec_helper'

describe yumrepo('epel') do
  it { should exist }
end

describe yumrepo('epel') do
  it { should_not be_enabled }
end
