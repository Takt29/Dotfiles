# Dotfiles

macOS用の設定ファイル（dotfiles）管理リポジトリです。

## 含まれる設定ファイル

- `.zprofile` - zshの環境変数やPATHの設定
- `.zshrc` - zshのエイリアスやその他の設定
- `.nanorc` - nanoエディタの設定
- `.gitignore_global` - Gitのグローバル除外設定
- `.gitconfig_global` - Gitのグローバル設定

## 動作環境

- macOS
- zsh
- git

## インストール方法

1. リポジトリをクローン:
```bash
git clone https://github.com/Takt29/Dotfiles.git
cd Dotfiles
```

2. インストールスクリプトを実行:
```bash
./install.sh
```

## カスタマイズ方法

### ローカル環境固有の設定

このリポジトリは`.local`ファイルによるローカル環境固有の設定をサポートしています。
以下のファイルを作成することで、特定のマシンでのみ必要なGit管理されない個別の設定を追加できます：

- `~/.zprofile.local` - ローカル環境固有のPATHや環境変数の設定


## 注意事項

- インストールスクリプトを実行する前に、既存の設定ファイルをバックアップすることを推奨します
- `.local`ファイルはGitで管理されないため、必要に応じて手動でバックアップを行ってください
