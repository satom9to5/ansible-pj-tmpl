require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
php_command="#{source_command} && php"

describe 'swfed module' do
  context command("#{php_command} -i | grep -P '^swfed$'") do
    its(:stdout) { should match /swfed/ }
  end
end
