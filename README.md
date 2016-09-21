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
- WiFiToggole.shの分割(TurnWiFiOn.sh, TurnWiFiOff.sh)
- hotkey登録設定(KeyHolder)
- sleep前に起動してWiFiを切る/sleep復帰時に起動してWiFiを入れる
- caffeinater機能
    - ショートカットで自動スリープ防止
    - その解除

## DONE & LOG
1. PC起動(ログイン)時に起動させる
    - http://questbeat.hatenablog.jp/entry/2014/04/19/123207
