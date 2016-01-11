# README

## テーブル構成
### users テーブル
deviceのデフォルトカラム
profile: :text
occupation: :string
position: :string
carrierwaveのデフォルトカラム

### prototypes テーブル
user_id: :references
title: :string
catch_copy: :string
concept: :text

### imgaes テーブル
prototype_id: :references
type: :string (Main or Sub)
carrirewaveのデフォルトカラム

### likes テーブル
user_id: :references
prototype_id: :references

### comments テーブル
user_id: :references
prototype_id: :references
comment: :text

### tags テーブル
name: :string
中間テーブルはacts-as-taggable-onで
