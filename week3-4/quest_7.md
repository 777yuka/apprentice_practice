# ファイルを操作できる

## 1. ファイルの中身を出力

/etc/hosts ファイルの中身を出力してください。/etc/hosts ファイルが存在しない場合は、何らかのテキストファイルの中身を出力してください。
<br>

### ▼回答
```bash
$ cat etc/hosts
```
  
`etc/hosts`とは  
ネットワークに接続されたコンピューターが名前解決を行うために使用される、IPアドレスとホスト名のマッピング情報が記述されたファイル。  
具体的には、IPアドレスとホスト名の対応が1行ごとに記述されている。  
  
※名前解決とは  
コンピューターネットワークにおいて、ホスト名（ドメイン名）からIPアドレスを特定すること。  
Webサイトにアクセスする場合に以下の処理が行われている。  
1、ネットワーク上のDNSサーバーに、ドメイン名をIPアドレスに変換するリクエストを送信する。  
2、DNSサーバーは、リクエストされたドメイン名が属するIPアドレスを持つサーバーの、IPアドレスを返す。  

---

## 2. ファイルの中身をスクロール表示

/etc/hosts ファイルの中身をスクロール式で表示してください。/etc/hosts ファイルが存在しない場合は、何らかのテキストファイルの中身を表示してください。
<br>

### ▼回答
```bash
$ cat etc/hosts | less
```
`Enter`で1行ずつ進む  
`q`で閉じる  

---

## 3. ファイルの作成

ホームディレクトリの直下に、README.md という名前の空ファイル（中身が空のファイル）をコマンドを利用して作成してください。
<br>

### ▼回答
```bash
$ touch README.md
$ ls
=>
README.md
```
---

## 4. ファイル名の変更

先程作成した README.md ファイルの名前を TMP.md という名前に変更してください。
<br>

### ▼回答
```bash
$ mv README.md TMP.md
$ ls
=>
TMP.md
```

---

## 5. ファイルのコピー

先程作成した TMP.md ファイルをコピーして COPY.md ファイルを作成してください。
<br>

### ▼回答
```bash
$ cp TMP.md COPY.md
@ ls
=>
COPY.md TMP.md
```
---

## 6. ファイルの削除

先程作成した TMP.md ファイルを削除してください。
<br>

### ▼回答

---
```bash
$ rm -f TMP.md
$ ls
=>
COPY.md
```
## 7. シンボリックリンク

作成した README.md に対して、シンボリックリンクを貼ってください。シンボリックリンクのファイル名は README_SYMBOLIC.md としてください。作成後、README.md に対して任意の文章を追記してください。その後、symbolic_file の中身を出力し、追記した内容が README_SYMBOLIC.md にも反映されていることを確認してください。
<br>

### ▼回答
シンボリックリンクを作成
```bash
$ ln -s README.md README_SYMBOLIC.md
```
文字コードを追加
```bash
$ echo Hello > README.md
```
参照の確認
```bash
$ cat README.md
=> Hello
```
シンボリックリンクからも参照できるか確認
```bash
$ cat README_SYMBOLIC.md
=> Hello
```
シンボリックリンクを削除
```bash
$ unlink README_SYMBOLIC.md
```

**シンボリックリンクとは**  
OSのファイルシステムの機能の一つで、特定のファイルやディレクトリを指し示す別のファイルを作成し、それを通じて本体を参照できるようにする仕組み。  
リンクは本体と同じディレクトリに置いても良いが、通常は別の場所から参照できるようにするために作成される。  
削除を指示するとシンボリックリンクが削除され、本体は影響を受けない。  
Windowsだとショートカットと呼ばれるものに値する。

[参考URL](https://s-port.shinwart.com/tech-column/kawatama03/)

---

## 8. ファイルの検索

ホームディレクトリ以下のファイルに対して、README という文字列が含まれるファイルを全て検索し、出力してください。なお、find コマンドを使用して実現することができます。
<br>

### ▼回答
```bash
$ find ~ -type f -name "*README*"
=> /root/README.md
```
---

[参考URL](https://qiita.com/pokari_dz/items/0f14a21e3ca3df025d21)

## 9. 検索

~/sample.txt ファイルを作成し、以下の内容を記載してください。

```bash
apple
banana
grape
lemon
```

その上で、sample.txt ファイルから、"a" で始まる単語を検索してください。なお、grep コマンドを使用して実現することができます。
<br>

### ▼回答
```bash
$ echo -e "apple\nbanana\ngrape\nlemon" > sample.txt
$ cat -e sample.txt
=>
apple$
banana$
grape$
lemon$
```
これはファイル名が出てきてしまった
```bash
$ grep a -rl sample.txt
```
これで文字の出力が成功
```bash
$ grep '\ba' sample.txt
=> apple
```

[参考URL1](https://mebee.info/2021/09/21/post-42631/)
[参考URL2](https://qiita.com/pokari_dz/items/0f14a21e3ca3df025d21)

---
