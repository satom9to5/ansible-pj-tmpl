require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
php_command="#{source_command} && php"

describe 'pecl_http module' do
  context command("#{php_command} -i | grep -P '^http$'") do
    its(:stdout) { should match /http/ }
  end
end
