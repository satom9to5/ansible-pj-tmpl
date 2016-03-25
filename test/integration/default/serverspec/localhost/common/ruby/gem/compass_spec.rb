require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
gem_command="#{source_command} && gem"

describe 'sass install' do
  context command("#{gem_command} list | grep -P '^sass'") do
    its(:stdout) { should match /sass/ }
  end 
end

describe 'compass install' do
  context command("#{gem_command} list | grep -P '^compass'") do
    its(:stdout) { should match /compass/ }
  end 
end
