ユーザーテーブル (Users)
### Association

* has_many :orders
* has_many :items
| Column             | Type   | Options                  | 説明 |
|--------------------|--------|--------------------------|---|
| nickname           | string | null: false | ニックネーム |
| email              | string | null:false, unique: true | メールアドレス |
| encrypted_password | string | null: false              | 暗号化されたパスワード (必須) |
| last_name          | string | null: false              | 姓 |
| first_name         | string | null: false              | 名 |
| last_name_kana     | string | null: false              | 姓（カナ） |
| first_name_kana    | string | null: false              | 名（カナ） |
| birthday           | date   | null: false              | 誕生日 |


注文テーブル (orders)
### Association

* belongs_to :user
* belongs_to :item
* has_one :shipping
| Column | Type       | Options                        | 説明 |
|--------|------------|--------------------------------|---|
| user   | references | null: false, foreign_key: true | ユーザーID (usersテーブルとの関連付け) |
| item   | references | null: false, foreign_key: true | 商品ID (itemsテーブルとの関連付け) |


配送先テーブル (shippings)
### Association

* belongs_to :order
| Column        | Type       | Options                        | 説明 |
|---------------|------------|--------------------------------|---|
| order         | references | null: false, foreign_key: true | 注文ID (ordersテーブルとの関連付け) |
| postcode      | string     | null: false                    | 郵便番号 |
| prefecture_id | integer    | null: false                    | 都道府県ID (都道府県マスタテーブルとの関連付け) |
| city          | string     | null: false                    | 市区町村 |
| block         | string     | null: false                    | 番地 |
| building      | string     |                                | 建物名 |
| phone_number  | string     | null: false                    | 電話番号 |


商品テーブル (items)
### Association

* has_one :order
* belongs_to :user
| Column           | Type       | Options                        | 説明 |
|------------------|------------|--------------------------------|---|
| user             | references | null: false, foreign_key: true | ユーザーID (usersテーブルとの関連付け) |
| item_name        | string     | null: false                    | 商品名 |
| description      | text       | null: false                    | 商品説明 |
| category_id      | integer    | null: false                    | カテゴリーID (カテゴリーマスタテーブルとの関連付け) |
| status_id        | integer    | null: false                    | 商品状態ID (商品状態マスタテーブルとの関連付け) |
| shipping_cost_id | integer    | null: false                    | 送料ID (送料マスタテーブルとの関連付け) |
| prefecture_id    | integer    | null: false                    | 出荷元都道府県ID (都道府県マスタテーブルとの関連付け) |
| shipping_date_id | integer    | null: false                    | 出荷日ID (出荷日マスタテーブルとの関連付け) |
| price            | integer    | null: false                    | 価格 |

