# 📚 API Reference для BlackZone Forum

## Базовий URL

```
http://localhost:5000/api
# або на хостингу
https://your-domain.com/api
```

## Аутентифікація

Всі захищені маршрути вимагають заголовок:
```
Authorization: Bearer YOUR_JWT_TOKEN
```

---

## 🔐 AUTH API

### Реєстрація

**POST** `/auth/register`

```json
{
  "username": "MyUsername",
  "email": "user@example.com",
  "password": "password123"
}
```

**Response:**
```json
{
  "success": true,
  "token": "eyJhbGc...",
  "user": {
    "id": "603d...",
    "username": "MyUsername",
    "email": "user@example.com",
    "avatar": "https://ui-avatars.com/...",
    "isAdmin": false
  }
}
```

---

### Логін

**POST** `/auth/login`

```json
{
  "username": "Dmitro",
  "password": "09102014"
}
```

**Response:**
```json
{
  "success": true,
  "token": "eyJhbGc...",
  "user": {
    "id": "603d...",
    "username": "Dmitro",
    "email": "dmitro@blackzone.forum",
    "avatar": "...",
    "isAdmin": true,
    "role": {...}
  }
}
```

---

### Отримати поточного користувача

**GET** `/auth/me`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

**Response:**
```json
{
  "success": true,
  "user": {
    "id": "603d...",
    "username": "Dmitro",
    "email": "dmitro@blackzone.forum",
    "avatar": "...",
    "isAdmin": true,
    "postCount": 5
  }
}
```

---

### Отримати всіх користувачів

**GET** `/auth/users`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

**Response:**
```json
{
  "success": true,
  "count": 15,
  "users": [
    {
      "_id": "603d...",
      "username": "Dmitro",
      "email": "dmitro@blackzone.forum",
      "role": {...},
      "isBanned": false
    }
  ]
}
```

---

### Видати роль користувачу

**PUT** `/auth/users/:userId/role`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

Body:
```json
{
  "roleId": "603d...role-id"
}
```

---

### Забанити користувача

**PUT** `/auth/users/:userId/ban`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

---

### Розбанити користувача

**PUT** `/auth/users/:userId/unban`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

---

## 📂 FORUM API

### Отримати всі категорії

**GET** `/forum/categories`

**Response:**
```json
{
  "success": true,
  "count": 9,
  "categories": [
    {
      "_id": "603d...",
      "name": "GTA San Andreas",
      "description": "Discussions about GTA SA",
      "icon": "🎮",
      "color": "#FF6B6B",
      "order": 1
    }
  ]
}
```

---

### Створити категорію

**POST** `/forum/categories`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

Body:
```json
{
  "name": "Нова категорія",
  "description": "Опис",
  "icon": "📌",
  "color": "#4a90e2"
}
```

---

### Отримати теми категорії

**GET** `/forum/categories/:categoryId/topics`

**Response:**
```json
{
  "success": true,
  "count": 5,
  "topics": [
    {
      "_id": "603d...",
      "title": "Best GTA SA mods?",
      "description": "Share your favorite mods",
      "category": "603d...",
      "creator": {
        "username": "Dmitro",
        "avatar": "..."
      },
      "isSticky": false,
      "isLocked": false,
      "views": 45,
      "postCount": 12,
      "createdAt": "2024-02-04T10:30:00Z"
    }
  ]
}
```

---

### Створити тему

**POST** `/forum/topics`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

Body:
```json
{
  "title": "Назва теми",
  "description": "Опис теми",
  "categoryId": "603d...category-id"
}
```

---

### Оновити тему

**PUT** `/forum/topics/:topicId`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

Body:
```json
{
  "title": "Нова назва",
  "description": "Новий опис",
  "isSticky": true,
  "isLocked": false
}
```

---

### Видалити тему

**DELETE** `/forum/topics/:topicId`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

---

## 💬 POSTS API

### Створити повідомлення

**POST** `/posts`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

Body:
```json
{
  "content": "Це прикладне повідомлення",
  "topicId": "603d...topic-id"
}
```

**Response:**
```json
{
  "success": true,
  "post": {
    "_id": "603d...",
    "content": "Це прикладне повідомлення",
    "author": {
      "username": "Dmitro",
      "avatar": "..."
    },
    "topic": "603d...",
    "likes": [],
    "createdAt": "2024-02-04T10:30:00Z"
  }
}
```

---

### Отримати повідомлення теми

**GET** `/posts/topic/:topicId`

**Response:**
```json
{
  "success": true,
  "count": 3,
  "posts": [...]
}
```

---

### Лайкнути повідомлення

**PUT** `/posts/:postId/like`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

---

### Видалити повідомлення

**DELETE** `/posts/:postId`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

---

## 🔑 ROLES API

### Отримати всі ролі

**GET** `/roles`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

**Response:**
```json
{
  "success": true,
  "count": 2,
  "roles": [
    {
      "_id": "603d...",
      "name": "Admin",
      "description": "Administrator",
      "permissions": {
        "canCreateTopic": true,
        "canDeleteTopic": true,
        "canEditTopic": true,
        "canCreatePost": true,
        "canDeletePost": true,
        "canEditPost": true,
        "canBanUser": true,
        "canManageRoles": true,
        "canViewAdmin": true,
        "canAccessAllCategories": true
      }
    }
  ]
}
```

---

### Створити роль

**POST** `/roles`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

Body:
```json
{
  "name": "Moderator",
  "description": "Moderator role",
  "permissions": {
    "canCreateTopic": true,
    "canDeleteTopic": true,
    "canEditTopic": true,
    "canCreatePost": true,
    "canDeletePost": true,
    "canEditPost": true,
    "canBanUser": true,
    "canManageRoles": false,
    "canViewAdmin": true,
    "canAccessAllCategories": true
  }
}
```

---

### Оновити роль

**PUT** `/roles/:roleId`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

Body: (те саме, що при створенні)

---

### Видалити роль

**DELETE** `/roles/:roleId`

Headers:
```
Authorization: Bearer YOUR_TOKEN
```

---

## 🔍 Error Codes

```json
{
  "success": false,
  "message": "Error description"
}
```

### Поширені помилки:

- **400** - Invalid input
- **401** - Unauthorized (no token)
- **403** - Forbidden (no permissions)
- **404** - Not found
- **500** - Server error

---

## 🧪 Тестування API

### Використовуйте cURL:

```bash
# Реєстрація
curl -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"username":"test","email":"test@test.com","password":"123456"}'

# Логін
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"Dmitro","password":"09102014"}'

# Отримати категорії
curl http://localhost:5000/api/forum/categories
```

### Або використовуйте Postman:

1. Завантажте [Postman](https://www.postman.com/)
2. Імпортуйте цей файл як collection
3. Встановіть змінну `token` в environment
4. Виконуйте запити

---

## 📝 Примітки

- Всі дати в ISO 8601 форматі
- IDs - це MongoDB ObjectIds
- JWT токени дійсні 30 днів
- Пароль мінімум 6 символів
- Username унікальний (case-sensitive)
- Email унікальний

---

**Готово! Тепер можете розробляти на базі цього API 🚀**
