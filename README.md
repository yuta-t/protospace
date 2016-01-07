# README

## テーブル構成
### users テーブル
deviceのデフォルトカラム
profile: :text
occupation: :string
position: :string

### prototypes テーブル
user_id: :integer
title: :string
catch_copy: :string
concept: :text

### imgaes テーブル
imageable_type: :string (prototype or user)
imageable_id: :integer
carrirewaveのデフォルトカラム

### likes テーブル
user_id: :int
prototype_id: :int

### comments テーブル
user_id: :int
prototype_id: :int
comment: :text

### tags テーブル
name: :string
中間テーブルはacts-as-taggable-onで
