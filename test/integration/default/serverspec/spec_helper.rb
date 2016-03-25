require 'serverspec'
require 'yaml'

# test-kitchen＆Dockerな環境で動かす際の処理
# 上手い事Docker側にパラメータを渡す方法が見つからないのでひとまず環境変数で判定
if !ENV.has_key?('TARGET_HOST') && ENV.has_key?('BUSSER_ROOT')
  ansible_base_dir = "/tmp/kitchen/"
else
  ansible_base_dir = File.dirname(__FILE__) + "/../../../../"
end

group_vars = YAML.load_file(ansible_base_dir + "group_vars/localhost")

# spec内で使用する値を格納
properties = {}
properties[:group_vars] = group_vars

set :backend, :exec
set :path, '/usr/libexec:$PATH'

set_property properties
