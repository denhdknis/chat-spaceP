# README

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique:true|

### Association
- has_many :users, through: :members
- has_many :members
- has_many :messages


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique:true,index:true|
|email|string|null: false, unique: true|
|password|string|null: false , unique: true|

### Association
- has_many :groups, through: :members
- has_many :members
- has_many :messages



## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|image|string||
|group_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group


## memberテーブル

|Column|Type|Options|
|------|----|-------|
|group_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group