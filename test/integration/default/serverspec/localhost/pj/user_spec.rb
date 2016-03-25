require 'spec_helper'

user=property[:group_vars]['pj_name']

describe user(user) do
  it { should exist }
  it { should have_home_directory "/home/#{user}" }
  it { should have_login_shell '/bin/bash' }
end
