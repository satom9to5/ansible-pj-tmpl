require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
php_command="#{source_command} && php"

describe 'graphviz package install' do
  context package('graphviz') do
    it { should be_installed }
  end
end  

describe 'xhprof module' do
  context command("#{php_command} -i | grep -P '^xhprof$'") do
    its(:stdout) { should match /xhprof/ }
  end
end
