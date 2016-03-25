# ansible-playbook

serverspecのテストコード
test-kitchen + dockerの初期設定も含む

## playbook一覧
 - add_branch.yml
   ブランチ追加用playbook。roles/pj/environment/vars/main.ymlを書き換えて実行すればApacheのVirtualHostが追加される

 - docker.yml
   Dockerインストール用playbook。Docker内でdockerインストールは出来ないので分割

 - local_user.yml
   ローカルユーザー追加用playbook。vimやgitの設定を行う。

 - pj_setup.yml
   環境構築メインplaybook

## test-kitchen + dockerのコマンド
### インストール
```
$ bundle install
```

### テスト用Dockerインスタンス作成
```
$ kitchen create
```

### Dockerインスタンスへのプロビジョニング開始
```
$ kitchen converge
```

### Dockerインスタンスへのテストコード（serverspec）実行
```
$ kitchen verify
```

※「kitchen setup」は、create + converge + verifyを一気に実行するコマンド

### Dockerインスタンス削除
```
$ kitchen destroy
```

### 作成されたDockerインスタンス一覧確認
```
$ kitchen list
```

# vagrant.sh
vagrantでのプロビジョニング用

- 実行権限が付与されているとansible-playbookで失敗する＆共有フォルダにファイルが存在していて実行権限を落とせないケースがあるため、tmpディレクトリ以下にインベントリファイルをコピーして対応。

- Windows上でUTF-8でかつコメント入りの.shファイルをプロビジョニングに使おうとすると、文字コード違いでRubyのエラーが発生する。
以下エラー内容。

```
C:/HashiCorp/Vagrant/embedded/gems/gems/vagrant-1.7.4/plugins/provisioners/shell/provisioner.rb:185:in `gsub!': invalid byte sequence in Windows-31J (ArgumentError)
```
