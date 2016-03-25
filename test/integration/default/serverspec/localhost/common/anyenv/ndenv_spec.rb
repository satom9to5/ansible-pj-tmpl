require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
ndenv_command="#{source_command} && ndenv"

describe 'anyenv check' do
  context command("#{ndenv_command}") do
    its(:exit_status) { should eq 0 }
  end

  context command("#{ndenv_command} install -l") do
    its(:exit_status) { should eq 0 }
  end
end
