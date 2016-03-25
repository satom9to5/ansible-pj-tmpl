require 'spec_helper'

describe 'Git check' do
  context file('/usr/bin/git') do
    it { should be_file }
    it { should be_executable }
  end
end
