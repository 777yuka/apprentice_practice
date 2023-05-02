# GitHub フローに従って開発を進めることができる

GitHub にプッシュをしたことのあるローカルリポジトリ（自分の PC 上のディレクトリ）に移動してください。

## 1. プルリクエストとは

プルリクエストは何か、何のためにあるかをプログラミング初心者にわかるように説明してください。
<br>

### ▼回答
開発者が、自分が作った変更を取り込んでもらうために、  
変更内容や理由などを説明しながら、自分の変更を他の開発者に見てもらうこと。  
そして、その変更を取り込んでもらうことができるかどうかは、相手が内容を確認して決める。  

---

## 2. プルリクエストの作成

以下のことを行い、プルリクエストを作成してください。

1. ローカル（自分の PC ）で pullrequest ブランチを新規作成し、切り替えてください
2. 任意のファイルに変更を行ってください
3. 変更をコミットしてください
4. GitHub に pullrequest というブランチ名で変更をプッシュしてください
5. GitHub を開き、pullrequest ブランチから main ブランチへのプルリクエストを作成してください
6. 変更内容を確認し、問題なければ GitHub 上で変更をマージしてください
7. GitHub 上の pullrequest ブランチを削除してください
<br>

### ▼回答
```bash
$ git branch pullrequest
$ git checkout pullrequest
# README.mdを変更
$ git add README.md
$ git commit -m "1行目を追加"
$ git push -u origin pullrequest
# GitHub上でプルリクエスト作成、マージ、pullrequestブランチ削除
```
---
## ３. ローカルへのリポートリポジトリの変更内容の取り込み

ローカルリポジトリのブランチを main ブランチに切り替えてください。

次に、リモートリポジトリ（GitHub）の main ブランチの内容をローカルリポジトリの main ブランチに取り込んでください。

それができたらローカルリポジトリの pullrequest ブランチを削除してください。

※開発を行う際はここから1に戻り、この1~2のステップを繰り返します
<br>

### ▼回答
```bash
$ git checkout main
$ git merge pullrequest
$ git branch -d pullrequest
```

---

## 4. GitHub フロー

[GitHub フロー](https://docs.github.com/ja/get-started/quickstart/github-flow) の公式リファレンスを一読してください。

その上で、今後の開発は GitHub フローに基づいて行ってください。多くの組織における基本的な開発フローは GitHub フローもしくは GitHub フローをベースにしたものになります。今から GitHub フローに慣れていきましょう。