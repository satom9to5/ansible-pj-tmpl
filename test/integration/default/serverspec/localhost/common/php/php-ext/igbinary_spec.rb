require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
php_command="#{source_command} && php"

describe 'igbinary module' do
  context command("#{php_command} -i | grep -P '^igbinary$'") do
    its(:stdout) { should match /igbinary/ }
  end
end

describe 'igbinary config' do
  context command("#{php_command} -i | grep 'session.serialize_handler'") do
    its(:stdout) { should match /igbinary/ }
  end
end
