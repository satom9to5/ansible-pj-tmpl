require 'spec_helper'

describe 'elasticsearch install' do
  context package('elasticsearch') do
    it { should be_installed }
  end

#  context service('elasticsearch') do
#    it { should be_enabled }
#  end
end
