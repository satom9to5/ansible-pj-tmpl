require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
php_command="#{source_command} && php"

describe 'php config' do
  context command("#{php_command} -i | grep 'display_errors'") do
    its(:stdout) { should match /STDOUT/ }
  end
end
