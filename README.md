
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
| status          | string   |
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