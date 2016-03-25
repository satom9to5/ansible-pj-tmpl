require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
rbenv_command="#{source_command} && rbenv"

describe 'anyenv check' do
  context command("#{rbenv_command}") do
    its(:exit_status) { should eq 1 }
  end

  context command("#{rbenv_command} install -l") do
    its(:exit_status) { should eq 0 }
  end
end
