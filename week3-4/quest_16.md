# GitHub を使って開発を進めることができる

## 1. リモートリポジトリ

GitHub 上に新規リポジトリを作成してください。
<br>

### ▼回答
1. GitHubのユーザーページへ移動
1. repositoryをクリック
1. Newをクリック
1. リモートリポジトリに名前をつけて（QUEST_16_practice）、新規作成

---

## 2. プッシュ

ローカルの PC 上に GitHub 上で作成したリポジトリの同じ名前のディレクトリを作成し、そのディレクトリ内に README.md　ファイルを作成してください。
<br>

### ▼回答
```bash
$ mkdir QUEST_16_practice
$ cd QUEST_16_practice
$ touch README.md
```
  
次に、ローカルリポジトリを新規作成し、変更をステージに追加、コミットしてください。
<br>

### ▼回答
```bash
$ git init
$ ls -a # .gitが存在しているか確認
$ git add README.md
$ git commit -m "READMEを新規作成"
```
  
リモートリポジトリを登録してください。そして GitHub に変更をプッシュしてください。
<br>

### ▼回答
```bash
$ git remote add origin パスもしくはSSH
# ローカルリポジトリに対して、リモートリポジトリを設定。
# originという名前のリモートリポジトリに、パスまたはSSH URLを指定して接続する。
$ git branch -M main
# `-M`オプションは、ブランチ名を変更するコマンド。
# これは、Gitのバージョンアップによって既定のブランチ名がmainに変更されたため。元々のデフォルト名は`master`だった。
$ git push -u origin main
# 作成したローカルのmainブランチを、リモートリポジトリのoriginという名前のリポジトリにプッシュする。
# -uオプションは、次回以降のプッシュ時にデフォルトでoriginリポジトリのmainブランチにプッシュするように設定する。
```
## 3. 追加の変更をプッシュ

README.md に変更を追加してください。そしてその変更を GitHub にプッシュしてください。
<br>

### ▼回答
README.mdに1行追加したあとに
```bash
$ git add README.md
$ git commit -m "1行追加"
$ git push
 ```
---

## 4. クローン

GitHub 上にある他者が作成したリポジトリを自分の PC 上にクローンしてください。クローン対象は何でも良いです。
<br>

### ▼回答

1. GitHub 上で、クローンしたいリポジトリのページにアクセス
1. 「Code」という緑色のボタンをクリックし、HTTPS、SSH、などのURLをコピー
1. ターミナルを開いて、リポジトリをクローンしたいディレクトリに移動
1. コマンドを使用して、リポジトリをクローンする

- HTTPSの場合
```bash
$ git clone <クローン URL>
```
- SSHの場合
```bash
$ git clone https://github.com/ユーザー名/リポジトリ名.git
```
---