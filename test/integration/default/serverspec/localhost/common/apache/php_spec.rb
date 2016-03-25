require 'spec_helper'

describe 'php module' do
  context command("/usr/sbin/httpd -M | grep -P 'php.*module'") do
    its(:stdout) { should match /php/ }
  end
end
