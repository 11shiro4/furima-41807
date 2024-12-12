| Column | Type | Options | 説明 |
|---|---|---|---|

ユーザーテーブル (Users)
| nickname | string | unique: true | ニックネーム |
| email | string | unique: true | メールアドレス |
| password | string | null: false | 暗号化されたパスワード (必須) |
| last_name | string |  | 姓 |
| first_name | string |  | 名 |
| last_name_kana | string |  | 姓（カナ） |
| first_name_kana | string |  | 名（カナ） |

注文テーブル (orders)
| id | integer |  | 注文ID (主キー) |
| buyer_id | integer | foreign_key: true | ユーザーID (usersテーブルとの関連付け) |
| item_id | integer | foreign_key: true | 商品ID (itemsテーブルとの関連付け) |

配送先テーブル (shipping)
| id | integer |  | 配送先ID (主キー) |
| order_id | integer | foreign_key: true | 注文ID (ordersテーブルとの関連付け) |
| postcode | string |  | 郵便番号 |
| prefecture_id | integer | foreign_key: true | 都道府県ID (都道府県マスタテーブルとの関連付け) |
| city | string |  | 市区町村 |
| block_building | string |  | 番地、建物名など |
| phone_number | string |  | 電話番号 |

商品テーブル (items)
| item_id | integer |  | 商品ID (主キー) |
| seller_id | integer | foreign_key: true | ユーザーID (usersテーブルとの関連付け) |
| item_image | string |  | 商品画像 (ファイルパスなど) |
| item_name | string |  | 商品名 |
| description | string |  | 商品説明 |
| category_id | integer | foreign_key: true | カテゴリーID (カテゴリーマスタテーブルとの関連付け) |
| status | integer | foreign_key: true | 商品状態ID (商品状態マスタテーブルとの関連付け) |
| shipping_cost_id | integer | foreign_key: true | 送料ID (送料マスタテーブルとの関連付け) |
| prefecture_id | integer | foreign_key: true | 出荷元都道府県ID (都道府県マスタテーブルとの関連付け) |
| shipping_date_id | integer | foreign_key: true | 出荷日ID (出荷日マスタテーブルとの関連付け) |
| price | integer |  | 価格 |

