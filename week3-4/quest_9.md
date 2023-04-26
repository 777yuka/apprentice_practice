# パーミッションを操作できる

## 1. ファイルのオーナーとグループ

ホームディレクトリの直下に、README.md という名前の空ファイルを作成してください。

その上で、README.md ファイルのオーナーとグループを確認してください。
<br>

### ▼回答
```bash
$ cd
$ touch README.md
$ ls -l README.md
=> -rw-r--r-- 1 root root 6 Apr 26 04:30 README.md
```
・オーナー：root  
・グループ：root  

---

## 2. ファイルのパーミッション

README.md ファイルのパーミッションを確認し、誰に何の権限が付与されているかを説明してください。
<br>

### ▼回答
```bash
$ ls -l README.md
=> -rw-r--r-- 1 root root 6 Apr 26 04:30 README.md
```

・所有者：読み書き  
・所有グループ：読み  
・その他：読み  

---

## 3. ファイルのパーミッションの設定

README.md ファイルのオーナーに対して、読み取り、書き込み、実行の全ての権限を付与してください。
<br>

### ▼回答
```bash
$ chmod u+x README.md
$ ls -l README.md
=> -rwxr--r-- 1 root root 6 Apr 26 04:30 README.md
```

---

## 4. ディレクトリのパーミッションの設定

ホームディレクトリの直下に、permission という名前の空ディレクトリを作成してください。
<br>

### ▼回答
permission ディレクトリのグループに対して、書き込み権限を付与してください。
```bash
$ mkdir permission
$ ls -ld permission/
=> drwxrwxr-x 2 root root 4096 Apr 26 04:36 permission/
```
すでに書き込み権限があったので一度剥奪
```bash
$ chmod g-w permission/
$ root@72320e87b087:~# ls -ld permission/
=> drwxr-xr-x 2 root root 4096 Apr 26 04:36 permission/
```
書き込み権限を付与
```bash
$ chmod g+w permission/
$ ls -ld permission/
=> drwxrwxr-x 2 root root 4096 Apr 26 04:36 permission/
```

---

## 5. スーパーユーザー

スーパーユーザーとして、ホームディレクトリの直下に superuser という名前の空ディレクトリを作成してください。

作成後、superuser ディレクトリのオーナーが誰かを確認してください。
<br>

### ▼回答
```bash
$ sudo mkdir /superuser
$ ls -ld superuser/
=> drwxr-xr-x 2 root root 4096 Apr 26 04:48 superuser/
```
