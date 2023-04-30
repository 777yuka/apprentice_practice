# 変更を元に戻すことができる

Git で管理されているディレクトリに移動してください。任意のファイルに何らかの変更を追加してください。

## 1. ファイルの変更の取り消し

ファイルへの変更を取り消してください。
<br>

### ▼回答
コミットした後のtest.txtに追記したあと、以下のコマンドを入力。
```bash
$ git checkout test.txt
```
すると、前のコミットの状態にすぐ戻る。

---

## 2. ステージの変更の取り消し

任意のファイルに変更を行い、ステージに追加してください。

ステージに追加された変更を取り消して、ワークツリーに戻してください（ステージに変更は追加されておらず、ワークツリーに変更内容が残っている状態にしてください）。
<br>

### ▼回答
変更したファイルをステージングエリアに追加する
```bash
$ git add test.txt
```
ステージングエリアにあるか確認する
```bash
$ git status

# 出力結果 コミットされる変更…
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   test.txt
```
ステージングエリアから削除する（ワークツリーには変更が残っている状態）
```bash
$ git reset HEAD test.txt

# 出力結果 コミット用にステージングされていない変更があります…
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   test.txt
```

ちなみにステージに追加された変更を取り消して、  
ワークツリーの変更内容も削除するには、次のコマンドを使用します。
```bash
$ git reset --hard HEAD
```

- HEADとは
HEAD は、現在チェックアウトされているブランチの最新のコミットを指す、Gitの特殊なポインタです。  
つまり、HEAD は常に現在の作業ツリーが基づくコミットを指します。

---
