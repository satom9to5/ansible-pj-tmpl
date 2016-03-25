require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
gem_command="#{source_command} && gem"

describe 'bundle install' do
  context command("#{gem_command} list | grep -P '^bundle'") do
    its(:stdout) { should match /bundle/ }
  end 
end
