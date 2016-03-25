require 'spec_helper'

apache_port=property[:group_vars]['apache_port']

describe 'apache install' do
  context package('httpd'), :if => os[:family] == 'redhat' do
    it { should be_installed }
  end
  
  context service('httpd'), :if => os[:family] == 'redhat' do
    it { should be_enabled }
    it { should be_running }
  end
  
  context port(apache_port) do
    it { should be_listening }
  end
  
  context file('/etc/httpd/conf/httpd.conf') do
    it { should be_file }
  end
end
