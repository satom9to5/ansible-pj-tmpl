require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
anyenv_command="#{source_command} && anyenv"

describe 'anyenv check' do
  context command("#{anyenv_command}") do
    its(:exit_status) { should eq 0 }
  end

  context command("#{anyenv_command} install -l") do
    its(:exit_status) { should eq 0 }
  end
end
