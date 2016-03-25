require 'spec_helper'

describe 'subversion check' do
  context file('/usr/local/bin/svn') do
    it { should exist }
    it { should be_executable }
  end
end
