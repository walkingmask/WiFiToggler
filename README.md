# WiFiToggler

Turn Wi-Fi ON/OFF toggler!

## Install

## How to use

# Note
1. Macのkeycode
    - http://qiita.com/baba163/items/e2390c4529ec0448151d

## TODO
- hotkey登録設定(KeyHolder)
- sleep前に起動してWiFiを切る/sleep復帰時に起動してWiFiを入れる
- caffeinater機能
    - ショートカットで自動スリープ防止
    - その解除

## DONE & LOG
1. アイコン作成
1. Menu bar App化
    - https://www.raywenderlich.com/98178/os-x-tutorial-menus-popovers-menu-bar-apps
    1. ボタンへアイコン画像を適用
        - 32x32pxじゃないと表示されないっぽい
        - 32x32pxの画像をassetsにドラッグアンドドロップ
        - Macの2xに
        - AppDelegateにtemplate = trueを追加
    - story boardの削除
        - http://codefromabove.com/2014/09/xcode-6-removing-storyboards-and-creating-useful-empty-projects/
        - 変なエラー？が消えなかったのでプロジェクトを作り直してコピペ
    - Menu barにアイコン表示
    - GUIなし
