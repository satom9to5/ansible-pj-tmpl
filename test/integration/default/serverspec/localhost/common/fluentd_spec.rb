require 'spec_helper'

describe 'td-agent install' do
  context package('td-agent') do
    it { should be_installed }
  end

  context service('td-agent') do
    it { should be_enabled }
  end
end
