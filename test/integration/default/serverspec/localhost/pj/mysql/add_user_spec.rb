require 'spec_helper'

user=property[:group_vars]['pj_name']
mysql_command="mysql -u#{user} -p#{user} -Nse "

describe 'mysql user' do
  context command("#{mysql_command} 'SHOW GRANTS' | grep 'ALL PRIVILEGES'") do
    its(:stdout) { should match /ALL PRIVILEGES/ }
  end
end
