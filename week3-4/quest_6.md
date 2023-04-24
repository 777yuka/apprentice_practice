# マニュアルを確認できる

## 1. man コマンド

man コマンドを使用すると、コマンドのレファレンスマニュアルを表示することができます。ls コマンドのリファレンスマニュアルを man コマンドを使って確認してください。

### 回答
```bash
LS(1)                            User Commands                           LS(1)

NAME
       ls - list directory contents

SYNOPSIS
       ls [OPTION]... [FILE]...

DESCRIPTION
       List  information  about  the FILEs (the current directory by default).
       Sort entries alphabetically if none of -cftuvSUX nor --sort  is  speci-
       fied.

       Mandatory  arguments  to  long  options are mandatory for short options
       too.

       -a, --all
              do not ignore entries starting with .

              つづく
```
<br>
<br>

`man ls`、最初はエラーになりました。対応内容はこちらです。

<br>

Docker公式より、コマンドをコピーして入力
```
$ docker pull ubuntu
```
Dockerを起動
```
$ docker run -it -d --name ubuntu-test ubuntu
```
実行中のDockerコンテナを確認
```
$ docker ps

=>
CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS          PORTS     NAMES
999999999999   ubuntu    "/bin/bash"   19 seconds ago   Up 18 seconds  
```
Dockerコンテナ内でシェルを実行
```
$ docker exec -it ubuntu-test /bin/bash
```
Dockerコンテナ内の現在のディレクトリの中身を表示
```
$ ls

=>
bin   dev  home  lib32  libx32  mnt  proc  run   srv  tmp  var
boot  etc  lib   lib64  media   opt  root  sbin  sys  usr
```
コマンドのレファレンスマニュアルを表示
```
$ man ls

=>
This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, including manpages, you can run the 'unminimize'
command. You will still need to ensure the 'man-db' package is installed.
```
訳すると、  
このメッセージは、システムが最小限に抑えられており、manページを含めたコンテンツが削除されているため表示されています。manページを表示するには、unminimizeコマンドを実行して、man-dbパッケージがインストールされていることを確認する必要があります。以下のコマンドで実行できます。  
  
対処法を調べて、コマンドを実行。
  
最小構成システムで削除されたパッケージやコンテンツを復元し、manページなどを含める。
manページを表示するためのユーティリティであるman-dbパッケージをインストール。
```
$ sudo unminimize
$ sudo apt-get install man-db

=>
bash: sudo: command not found
bash: sudo: command not found
```
すどーどこですか（応答ないため、sudoコマンドがインストールされていない可能性あり）

```
$ which sudo

=> 応答なし
```
sudoパッケージをインストール。
```
$ apt-get update
$ apt-get install sudo
```
<br>
```
$ man ls
```
無事に使用できました。