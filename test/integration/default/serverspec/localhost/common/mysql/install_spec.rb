require 'spec_helper'

mysql_version=`mysql -V | awk '{ print $5 }'`.chomp.to_f

if mysql_version >= 5.6
  mysql_libs_package   = 'mysql-community-libs'
  mysql_server_package = 'mysql-community-server'
  mysql_devel_package  = 'mysql-community-devel'
else
  mysql_libs_package   = 'mysql-libs'
  mysql_server_package = 'mysql-server'
  mysql_devel_package  = 'mysql-devel'
end

describe 'MySQL install' do
  context package(mysql_libs_package) do
    it { should be_installed }
  end

  context package(mysql_server_package) do
    it { should be_installed }
  end

  context package(mysql_devel_package) do
    it { should be_installed }
  end

  context package('MySQL-python') do
    it { should be_installed }
  end

  context service('mysqld') do
    it { should be_enabled }
    it { should be_running }
  end

  context port(3306) do
    it { should be_listening }
  end
end
