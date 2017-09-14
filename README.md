# README

## groupテーブル

|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- has_many :users, through: :members
- has_many :members
- has_many :groups, though: :members


## userテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false , unique: true|
|user_id|integer|foreign_key: true|

### Association
- has_many :groups, through: :members
- has_many :members
- has_many :messages



## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|image|integer|null: false, unique: true|
|group_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group


## memberテーブル

|Column|Type|Options|
|------|----|-------|
|group|integer|foreign_key: true|
|user|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group