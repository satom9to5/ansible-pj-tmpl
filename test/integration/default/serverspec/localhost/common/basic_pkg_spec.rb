require 'spec_helper'

describe 'useful packages install' do
  context package('which') do
    it { should be_installed }
  end
  
  context package('tar') do
    it { should be_installed }
  end
  
  context package('zip') do
    it { should be_installed }
  end
  
  context package('unzip') do
    it { should be_installed }
  end
  
  context package('bzip2') do
    it { should be_installed }
  end
  
  context package('gcc') do
    it { should be_installed }
  end
  
  context package('libtool') do
    it { should be_installed }
  end
  
  context package('bash-completion') do
    it { should be_installed }
  end
  
  context package('zsh') do
    it { should be_installed }
  end
  
  context package('telnet') do
    it { should be_installed }
  end
  
  context package('curl') do
    it { should be_installed }
  end
  
  context package('ngrep') do
    it { should be_installed }
  end
  
  context package('nc') do
    it { should be_installed }
  end
  
  context package('nkf') do
    it { should be_installed }
  end
  
  context package('expect') do
    it { should be_installed }
  end
  
  context package('file') do
    it { should be_installed }
  end
  
  context package('vim-enhanced') do
    it { should be_installed }
  end
end

describe 'autoconf install' do
  context file('/usr/bin/autoconf') do
    it { should exist }
    it { should be_executable }
  end
end

describe 'automake install' do
  context file('/usr/bin/automake') do
    it { should exist }
    it { should be_executable }
  end
end

