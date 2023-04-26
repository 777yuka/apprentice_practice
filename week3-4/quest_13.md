# コミットができる

## 1. ローカルリポジトリの新規作成

任意の場所に git_practice という名前の新規ディレクトリを作成してください。作成したディレクトリに移動して、Git のローカルリポジトリを新規作成してください。
<br>

### ▼回答
```zsh
$ cd git_practice
$ git init
$ ls -a
=> .	..	.git
```

---

## 2. 変更をステージに追加

作成したディレクトリの下に README.md というファイルを作成してください。次に、作成したファイルをステージに追加してください。
<br>

### ▼回答
```zsh
$ touch README.md
$ git add .
$ git commit -m "メッセージ"
```

---

## 3. 変更を記録

ステージに追加した変更をローカルリポジトリに記録してください。なお、変更の記録のことを「コミット」と言います。
<br>

### ▼回答
```zsh
$ git remote add origin git@github.com:777yuka/git_practice.git
$ git branch -M main
$ git push -u origin main
```
