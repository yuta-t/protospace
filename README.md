# README

## テーブル構成
### users テーブル
deviceのデフォルトカラム
username: :string
profile: :text
occupation: :string
position: :string
carrierwaveのデフォルトカラム

### prototypes テーブル
user: :references
title: :string
catchcopy: :string
concept: :text

### imgaes テーブル
prototype: :references
image_type: :integer (Main = 0 or Sub = 1)
carrirewaveのデフォルトカラム

### comments テーブル
user: :references
prototype: :references
comment: :text

### likes テーブル
user: :references
prototype: :references

### tags テーブル
name: :string
中間テーブルはacts-as-taggable-onで
