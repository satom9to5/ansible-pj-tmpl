require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
gem_command="#{source_command} && gem"

describe 'serverspec install' do
  context command("#{gem_command} list | grep -P '^serverspec'") do
    its(:stdout) { should match /serverspec/ }
  end 
end

describe 'specinfra install' do
  context command("#{gem_command} list | grep -P '^specinfra'") do
    its(:stdout) { should match /specinfra/ }
  end 
end
