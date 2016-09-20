# WiFiToggler

Turn Wi-Fi ON/OFF toggler!

## Install

## How to use

## TODO
1. Menu bar App化
    - https://www.raywenderlich.com/98178/os-x-tutorial-menus-popovers-menu-bar-apps
    - アイコン作成
    - Menu barにアイコン表示
    - command + Qで消えないGUI
    - Windowに設定表示
    - そこでのON/OFF切り替え
    - 設定を変える？(KeyHolder)
- sleep前に起動してWiFiを切る
- sleep復帰時に起動してWiFiを入れる
- caffeinater機能
    - ショートカットで自動スリープ防止
    - その解除

## DONE & LOG
1. cocoapodsのインストール
1. cocoapodsで[Magnet](https://github.com/Clipy/Magnet)を導入
    - http://qiita.com/ShinokiRyosei/items/3090290cb72434852460
1. cocoapodsとxcode8の問題
    - http://qiita.com/Hakota/items/4a5e9201c7dc17e9017a
1. Magnetの問題
    - https://developer.apple.com/reference/appkit/nseventmodifierflags
    - Alternateはコメント化
    - それをやって"git reset --hard HEAD"(xcode init)をやったらなおった？
    - import cocoaが死んでる
    - Testx8というプロジェクトを立ち上げて再現してみるとUse of undeclared type 'Notification'と怒られる
    - 諦めてxcode7をインストール
1. Magnetを用いてxcode projectを立ち上げ
1. 一般ショートカットのテスト
1. シェルコマンドの実行
    - http://qiita.com/kitanoow/items/8b551a2d121ff95ef553
1. WiFiToggle.shの作成&ショートカットテスト
