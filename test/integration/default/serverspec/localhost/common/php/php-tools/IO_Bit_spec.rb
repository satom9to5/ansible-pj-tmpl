require 'spec_helper'

source_command='source /etc/profile.d/anyenv.sh'
phpenv_command="#{source_command} && phpenv"
php_command="#{source_command} && php"

phpenv_dir=File::dirname(`#{source_command} && which phpenv`) + "/../"
php_version=`#{php_command} -v | grep -P '^PHP' | awk '{ print $2 }'`.chomp

describe 'IO_Bit file check' do
  context file("#{phpenv_dir}versions/#{php_version}/lib/php/IO/Bit.php") do
    it { should be_file }
  end

  context file("#{phpenv_dir}versions/#{php_version}/lib/php/IO/Bit") do
    it { should be_directory }
  end
end
