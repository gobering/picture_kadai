Userモデル
| カラム名 | データ型 |
| -------- | -------- |
|   id     |          |
|   name   |   string    |
|   email  |    string |
| password-digest  |  string    |

Taskモデル
| カラム名        | データ型 |
| --------------- | -------- |
| id              |          |
| title           | string   |
| content         | string   |
| deadline        |  date    |
| status          | integer   |
| priority        | string   |
| user_id         | references   |

Labelモデル
| カラム名 | データ型 |
| -------- | -------- |
|   id     |          |
|   label_name |   string    |

Laberingモデル
| カラム名   | データ型 |
| ---------- | -------- |
| id       |          |
| task     | references   |
| label_id | references   |


# Herokuへのデプロイ

## yarn install

**初回の場合**

`$ heroku create`


**任意のブランチへpush**

`$ git add -A `

`$ git commit -m "commit message"`

`$ git push origin ブランチ名 or master`

**Heroku buildpackを追加**

`$ heroku buildpacks:set heroku/ruby`

`$ heroku buildpacks:add --index 1 heroku/nodejs`

**Herokuにデプロイ**

`$ git push heroku master or ブランチ名:master`
 
**データベース移行**

`$ heroku run rails db:migrate`