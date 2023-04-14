# 外部ライブラリを使うことができる

## 1. パッケージ管理ツール

パッケージ管理ツールとは、外部ライブラリを管理するためのツールです。  
Ruby では gem という形式で提供されています。  
gem を用いて、以下のことを実行してください。
<br>

世の中に公開されている gem を探し、1つ選択してください  
その gem をインストールしてください
<br>

### 回答
```
# Bundlerをインストールしている状態でこのコマンドを使用すると、初期状態のGemfileが作成できる。
bundle init
```
ここからは以下を参考  
[kaminari](https://github.com/kaminari/kaminari/blob/master/README.md)  
<br>

インストールされている gem の一覧を表示してください
<br>

### 回答
```
# 現在インストールされている gem の情報をターミナルで一覧で確認することができる
$ gem list --local
```
```
# gemが保存されているローカルのパスを教えてくれる
$ which gem
```
<br>

今回インストールした gem をアンインストールしてください
<br>

### 回答
```
# `bundle exec`は、ローカルのGemセットでコマンドを実行するために使用
bundle exec gem uninstall kaminari
#=> Successfully uninstalled kaminari-1.2.2
```
```
bundle install
#=> 
The Gemfile specifies no dependencies
Bundle complete! 0 Gemfile dependencies, 1 gem now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```
上記により**Gemfile.lock**からも削除されます。
<br>
<br>

## 2. パッケージの依存関係管理ツール
パッケージ管理ツールとは、外部ライブラリの依存関係を管理するためのツールです。  
Ruby では Bundler が使用されています。以下のことを実行してください。  

Bundler が何のためにあるのか、プログラミング初心者にわかるように説明してください
<br>

### 回答
- gemの依存関係とバージョンを管理するためのツール  
Aのgemを使用するために、Bのgemを使う場合、それぞれをインストールするのではなく、  
Bundlerが依存関係のあるgemを一気にインストールしてくれる  

- インストールするPCによってgemのバージョンが異なることで、  
共同開発などで不具合が生じることがある  
→bundlerができたことによって、gemを利用する全てのPCに同じversionのgem(依存するgemも含めて)を  
インストールすることができる  
<br>

Bundler を用いて、任意の gem を1つインストールしてください
<br>

### 回答

```
# Bundlerのバージョン確認ができる

$ bundler -v
```
上記「kaminari」をbundlerで実行済
<br>
<br>
<br>


参考  
[【初心者必見】Ruby on Railsで使う便利なgem5選について解説](https://blog.codecamp.jp/ruby-rails-gem5)  
[【Rails7】個人的によく使うGemのまとめ【11選】](https://blog.to-ko-s.com/recomended-gems/)  
[bundlerの仕組みを図解形式で徹底解説](https://pikawaka.com/rails/bundler)  
[Bundlerを使ってインストールしたgemを削除する方法](https://ama-tech.hatenablog.com/uninstall-gem-in-rails-app)  
<br>