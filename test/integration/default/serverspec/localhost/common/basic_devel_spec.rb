require 'spec_helper'

describe 'devel packages install' do
  context package('openssl-devel') do
    it { should be_installed }
  end
  
  context package('libcurl-devel') do
    it { should be_installed }
  end
end
