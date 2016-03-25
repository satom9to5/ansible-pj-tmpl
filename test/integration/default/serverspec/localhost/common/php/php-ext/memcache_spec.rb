require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
php_command="#{source_command} && php"

describe 'memcache module' do
  context command("#{php_command} -i | grep -P '^memcache$'") do
    its(:stdout) { should match /memcache/ }
  end
end

describe 'memcache config' do
  context command("#{php_command} -i | grep 'memcache.chunk_size' | awk -F ' => ' '{ print $3 }'") do
    its(:stdout) { should match /^32768$/ }
  end
end
