require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
php_command="#{source_command} && php"

describe 'xdebug module' do
  context command("#{php_command} -i | grep -P '^xdebug$'") do
    its(:stdout) { should match /xdebug/ }
  end
end

describe 'xdebug config' do
  context command("#{php_command} -i | grep 'xdebug.remote_enable'") do
    its(:stdout) { should match /On/ }
  end

  context command("#{php_command} -i | grep 'xdebug.remote_handler'") do
    its(:stdout) { should match /dbgp/ }
  end

  context command("#{php_command} -i | grep 'xdebug.remote_host'") do
    its(:stdout) { should match /localhost/ }
  end

  context command("#{php_command} -i | grep 'xdebug.remote_port'") do
    its(:stdout) { should match /9000/ }
  end
end
