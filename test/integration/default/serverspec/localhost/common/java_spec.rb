require 'spec_helper'

context command("java -version") do
  its(:exit_status) { should eq 0 }
end

