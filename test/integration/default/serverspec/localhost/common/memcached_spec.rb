require 'spec_helper'

describe 'memcached install' do
  context package('memcached') do
    it { should be_installed }
  end

  context service('memcached') do
    it { should be_enabled }
    it { should be_running }
  end

  context port(11211) do
    it { should be_listening }
  end
end
