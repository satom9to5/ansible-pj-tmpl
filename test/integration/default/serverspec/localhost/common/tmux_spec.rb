require 'spec_helper'

describe 'libevent install' do
  context file('/usr/lib/libevent.a') do
    it { should exist }
  end
end

describe 'tmux install' do
  context file('/usr/local/bin/tmux') do
    it { should exist }
    it { should be_executable }
  end
end

