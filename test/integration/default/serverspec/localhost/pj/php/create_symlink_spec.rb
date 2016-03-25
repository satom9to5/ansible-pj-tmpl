require 'spec_helper'

describe 'php symbolic link check' do
  context file('/usr/local/bin/php') do
    it { should exist }
    it { should be_symlink }
  end
end
