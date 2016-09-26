# WiFiToggler

Turn Wi-Fi On/Off toggler!

## Function

- Turn Wi-Fi On/Off with hotkey in anywhere
- Prevent auto sleep with hotkey (experimentally)
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
1. Remove empty directory

## How to use

1. Launch app
1. Press hotkey
    - Turn Wi-Fi Off  : ⇧ + F5
    - Turn Wi-Fi On   : ⇧ + F6
    - Ingest halcyon  : ⇧ + F1 (experimentally)
    - Ingest caffeine : ⇧ + F2 (experimentally)
1. Quit via status bar icon

## Uninstall

1. Remove items below
    - /Application/WiFiToggler.app
    - $HOME/Library/Developer/Xcode/DerivedData/ModuleCache (Option)
    - $HOME/Library/Developer/Xcode/DerivedData/WiFiToggler-* (Option)

## Note
1. Macのkeycode
    - http://qiita.com/baba163/items/e2390c4529ec0448151d

## TODO
- hotkey登録設定(KeyHolder)
- sleep前に起動してWiFiを切る/sleep復帰時に起動してWiFiを入れる
    - sleep/sleep解除の探知
- 名前を"Toggler"に変更？

## DONE & LOG
1. caffeinateのオプションを修正(-uの追加)
