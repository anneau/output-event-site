# Rails API
## 概要
### チーム
- GET api/v1/teams

チーム一覧をポイントの降順で返します。
- id
  - Type: integer
- name
  - Type: string
- likes_count
  - チームの総LGTM数
  - Type: integer
- items_count
  - チームの総投稿数
  - Type: integer
- points_count
  - チームの総得点
  - Type: integer
- users
  - そのチームに紐づいている全てのuser
```
GET /api/v1/teams HTTP/1.1
```
```
HTTP/1.1 200
Content-Type: application/json

[
  {
    "id": 1,
    "name": "teamA",
    "points_count": 11,
    "likes_count": 1,
    "items_count": 1,
    "users": [
      {
        "id": 1,
        "name": "sho-hata",
        "points_count": 11,
        "likes_count": 1,
        "items_count": 1,
      }
    ]
  }
]
```
