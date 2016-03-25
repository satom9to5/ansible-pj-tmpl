require 'spec_helper'

describe 'Percona repository' do
  context package('percona-release') do
    it { should be_installed }
  end
end
