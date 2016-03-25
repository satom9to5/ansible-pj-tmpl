require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
ruby_command="#{source_command} && ruby"

context command("#{ruby_command} -v") do
  its(:exit_status) { should eq 0 }
end

