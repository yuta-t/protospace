# README

## テーブル構成
### users テーブル
deviceのデフォルトカラム
profile: :text
occupation: :string
position: :string

### prototypes テーブル
user_id: :references
title: :string
catch_copy: :string
concept: :text

### imgaes テーブル
imageable_type: :string (prototype_main or prototype_sub or user)
imageable_id: :references
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
