require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
php_command="#{source_command} && php"

context command("#{php_command} -v") do
  its(:exit_status) { should eq 0 }
end

describe 'php module' do
  context command("#{php_command} -i | grep -P '^mysqli$'") do
    its(:stdout) { should match /mysqli/ }
  end
end

describe 'php config' do
  context command("#{php_command} -i | grep 'date.timezone' | grep 'Asia/Tokyo'") do
    its(:stdout) { should match /Asia\/Tokyo/ }
  end
end
