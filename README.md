# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


##  usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null: false、unique:ture|
|password|string|null:false|
|password_confiramation|string|null:false|
|family_name|string|null:false|
|first_name|string|null:false|
|hurigana_family_name|string|null:false|
|hurigana_first_name|string|null:false|
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_date|integer|null:false|
|tel|integer|null:false,unique:ture|

## Association
- has_many:cards
- has_one :address
- has_many:comennts
- has_many:favorites
- has_many:products










## products テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|conditions|string|null:false|
|delivery_charge|integer|null:false|
|prefecture|string|null:false|
|delicery_day|integer|null:false|
|size|string|null:false|
|text|text|null:false|
|user_id|integer|null:false,foreign_key: true|
|caregory_id|referencesinteger|null:false,foreign_key: true|
|brand_id|integer|null:false,foreign_key: true|

## Association
- belongs_to:user
- belongs_to:category
- belongs_to:brand
- has_many:images
- has_many:favorites
- has_many:comments





## cards テーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null:false|
|expiration_date|integer|null:false
|security_code|integer|null:false|
|user_id|integer|null:false foreign_key: true|


## Association
- belongs_to:user


## images テーブル
|Column|Type|Options|
|------|----|-------|
|picture|references|null:false|
|products_id|integer|null:false,foreign_key: true|


## Association
- belongs_to:product


## address テーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null:false|
|administrative＿divisions|string|null:false|
|city|string|null:false|
|street_number|string|null:false|
|apartment|string|null:false|
|user_id|integer|null:false,foreign_key: true|


## Association
- belongs_to:user




## categories テーブル
|Column|Type|Options|
|------|----|-------|
|theme|string|null:false|
|variety|string|null:false|
|detail|string|null:false|


## Association
- has_many:product


## brands テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


## Association
- has_many:product





## favorites テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|products_id|integer|null: false, foreign_key: true|


## Association
- belongs_to:user
- belongs_to:product


## comennts テーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null:false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|


## Association
- belongs_to:user
- belongs_to:product