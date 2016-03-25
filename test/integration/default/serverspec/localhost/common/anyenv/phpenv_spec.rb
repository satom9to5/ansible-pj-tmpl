require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
phpenv_command="#{source_command} && phpenv"

describe 'anyenv check' do
  context command("#{phpenv_command}") do
    its(:exit_status) { should eq 0 }
  end

  context command("#{phpenv_command} install --releases") do
    its(:exit_status) { should eq 1 }
  end
end
