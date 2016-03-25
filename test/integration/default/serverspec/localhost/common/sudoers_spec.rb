require 'spec_helper'

describe package('sudo') do
  it { should be_installed }
end

describe file('/etc/sudoers.d/requiretty') do
  it { should exist }
end
