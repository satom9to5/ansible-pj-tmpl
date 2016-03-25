require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
node_command="#{source_command} && node"

context command("#{node_command} -v") do
  its(:exit_status) { should eq 0 }
end

