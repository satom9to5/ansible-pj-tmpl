require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
php_command="#{source_command} && php"

describe 'memcached module' do
  context command("#{php_command} -i | grep -P '^memcached$'") do
    its(:stdout) { should match /memcached/ }
  end
end

describe 'memcached config' do
  context command("#{php_command} -i | grep 'memcached.serializer'") do
    its(:stdout) { should match /igbinary/ }
  end
end
