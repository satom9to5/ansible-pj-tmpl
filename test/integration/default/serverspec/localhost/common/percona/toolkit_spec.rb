require 'spec_helper'

describe 'Percona toolkit' do
  context package('percona-toolkit') do
    it { should be_installed }
  end
end
