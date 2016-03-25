require 'spec_helper'

describe 'MySQL setting' do
  context mysql_config('character-set-server') do
    its(:value) { eq 'utf8' }
  end

  context mysql_config('key-buffer-size') do
    its(:value) { should >= 536870912 }
  end

  context mysql_config('innodb-buffer-pool-size') do
    its(:value) { should >= 1073741824 }
  end

  context mysql_config('external-locking') do
    its(:value) { eq 'FALSE' }
  end

  context mysql_config('max-allowed-packet') do
    its(:value) { should >= 1048576 }
  end

  context mysql_config('table-open-cache') do
    its(:value) { should >= 1024 }
  end

  context mysql_config('sort-buffer-size') do
    its(:value) { should >= 8388608 }
  end

  context mysql_config('read-buffer-size') do
    its(:value) { should >= 8388608 }
  end

  context mysql_config('innodb-log-file-size') do
    its(:value) { should >= 134217728 }
  end

  context mysql_config('innodb-log-file-size') do
    its(:value) { should >= 134217728 }
  end

  context mysql_config('net-buffer-length') do
    its(:value) { should >= 2048 }
  end

  context mysql_config('thread-stack') do
    its(:value) { should >= 131072 }
  end

  context mysql_config('innodb-file-per-table') do
    its(:value) { eq 'TRUE' }
  end
end
