require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
php_command="#{source_command} && php"

describe 'redis module' do
  context command("#{php_command} -i | grep -P '^redis$'") do
    its(:stdout) { should match /redis/ }
  end
end
