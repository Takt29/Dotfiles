#! /bin/bash

## Menu Bar ##

# バッテリーの％表示
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# 日付表示 (ex. Thu Feb 6 7:34:56)
defaults write com.apple.menuextra.clock -string "EEE MMM d  H:mm:ss"

## Keyboard ##

# キーリピート開始までのタイミング
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# キーリピートの速度
defaults write NSGlobalDomain KeyRepeat -int 2

## Mission Control ##

# 操作スペースを自動で入れ替えない
defaults write com.apple.dock mru-spaces -bool false

## Screen Saver ##

defaults write com.apple.screensaver tokenRemovalAction -int 0

## Firewall ##

# FirewallをON
# sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

## Desktop ##

defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

## Dock ##

# Dockを右側に表示
defaults write com.apple.dock orientation right

# Dockを自動的に隠す
defaults write com.apple.dock autohide -bool true

# アイコンサイズ
defaults write com.apple.dock largesize -int 45
defaults write com.apple.dock tilesize -int 25

# Dockの拡大機能をON
defaults write com.apple.dock magnification -bool true

# 最近使ったアプリケーションを非表示
defaults write com.apple.dock show-recents -bool false

## Finder ##

# ライブラリディレクトリを表示
chflags nohidden ~/Library

# 拡張子を全て表示
defaults write -g AppleShowAllExtensions -bool true

# USB やネットワークストレージに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

## Mouse & TrackPad ##

# ダブルクリックでウィンドウを最小化
defaults write -g AppleActionOnDoubleClick -string "Minimize"

# Enable three finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1

# Disable double tap drag
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool false
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool false

# Disable three finger gesture
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 0

# Enable four finger swipe gesture
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerPinchGesture -int 2

# Enable five finger gesture
defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFiveFingerPinchGesture -int 2

# Disable Smart Zoom
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -int 0

# Lookup
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2

# Disable Force click
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool false
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool true
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -bool false

# Tap to Click
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

## Safari ##

# アドレスバーに完全なURLを表示
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# ステータスバーを表示
defaults write com.apple.Safari ShowStatusBar -bool true

# ファイルのダウンロード後に自動で開くのを無効化
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

## TextEdit ##

# デフォルトを標準テキストにする
defaults write com.apple.TextEdit RichText -bool false

# HTMLを標準テキストで開く
defaults write com.apple.TextEdit IgnoreHTML -bool true

# 自動修正を無効化
defaults write com.apple.TextEdit SmartDashes -bool false
defaults write com.apple.TextEdit SmartQuotes -bool false
defaults write com.apple.TextEdit SmartCopyPaste -bool false
defaults write com.apple.TextEdit CorrectSpellingAutomatically -bool false
