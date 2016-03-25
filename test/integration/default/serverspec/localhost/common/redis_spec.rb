require 'spec_helper'

describe 'redis install' do
  context package('redis') do
    it { should be_installed }
  end

  context service('redis') do
    it { should be_enabled }
    it { should be_running }
  end

  context port(6379) do
    it { should be_listening }
  end
end
