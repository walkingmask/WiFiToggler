# WiFiToggler

Turn Wi-Fi On/Off toggler!

## Function

- Turn Wi-Fi On/Off with hotkey in anywhere
- Launch at login

## Environment

- Mac OS X 10.11
- Xcode 7.3.1
- Swift 2.3
- cocoapods 1.0.1

## Install

1. git clone https://github.com/walkingmask/WiFiToggler.git
1. cd WiFiToggler
1. pod install
1. open "WiFiToggler.xcworkspace"
1. Product -> Archive
1. Export -> Export as a Mac Application
1. Open the directory and Move "WiFiToggler.app" to /Application

## How to use

1. Launch app
1. Press hotkey
    - Turn Wi-Fi Off : ⇧ + F5
    - Turn Wi-Fi On  : ⇧ + F6
1. Quit via status bar icon

## Note
1. Macのkeycode
    - http://qiita.com/baba163/items/e2390c4529ec0448151d

## TODO
1. menuのインデント揃え
- caffeineを使っている時にアイコンをどうにかして動いてるのがわかるようにする
- hotkey登録設定(KeyHolder)
- sleep前に起動してWiFiを切る/sleep復帰時に起動してWiFiを入れる

## DONE & LOG
1. スクリプトの実行コマンドとパスの修正
    - http://nakajijapan.github.io/blog/2014/07/11/xcode-folder-references/
    - http://d.hatena.ne.jp/Watson/20100324/1269427861
1. READMEのアップデート(installにpod installを追加)
1. シェルスクリプトファイルを削除してコードに直書き
1. caffeinateを使った自動スリープ防止を試験導入
