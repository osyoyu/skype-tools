Skype Tools
===========

## これはなに
Skypeのmain.dbを読んで、いろんな情報を解析するツール(らしい)

## 必要なもの
* main.db (オリジナルをコピーして使うことを推奨します)
    * Windows: C:/Users/(Windowsのユーザー名)/AppData/Roaming/Skype/(SkypeName)/main.db
    * Linux: ~/.Skype/(SkypeName)/main.db

## 使い方
例: スクリプトと同じディレクトリに main.db が存在する場合

    $ ruby search.rb main.db

起動後はスクリプトがガイドしますので、画面の指示に従って入力してください。
コマンドラインオプションも用意する予定です。

## 含まれているスクリプト
* search.rb (発言検索、正規表現対応)
* count.rb (発言数カウント)

## ライセンス
Skype Tools は X11/MIT License の下で配布されています。
詳細は同梱の LICENSE をご確認ください。

また、Wikipediaに大変わかりやすい解説があります。
(http://ja.wikipedia.org/wiki/MIT_License)
