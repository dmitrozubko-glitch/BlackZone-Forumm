# Гайд розгортання BlackZone Forum

## 📋 Зміст

1. [Швидкий старт (локально)](#швидкий-старт)
2. [Розгортання на Heroku](#heroku)
3. [Розгортання на Railway](#railway)
4. [Розгортання на Render](#render)
5. [Docker Compose](#docker-compose)

---

## Швидкий старт

### Вимоги
- Node.js 18+ ([завантажити](https://nodejs.org/))
- MongoDB ([Atlas](https://www.mongodb.com/cloud/atlas) або локально)
- Git

### Крок 1: Клонування та встановлення

```bash
# Навігація до папки проекту
cd BlackZone-Forum

# Запустіть скрипт встановлення (Windows)
setup.bat

# Або вручну встановіть залежності:
cd server && npm install && cd ..
cd client && npm install && cd ..
```

### Крок 2: Налаштування MongoDB

1. Перейдіть на [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
2. Зареєструйтеся (безплатно)
3. Створіть новий кластер
4. Отримайте рядок підключення
5. Замініть `MONGODB_URI` в файлі `.env` (server/)

Приклад:
```
mongodb+srv://username:password@cluster0.mongodb.net/blackzone-forum?retryWrites=true&w=majority
```

### Крок 3: Запуск локально

**Terminal 1 - Backend:**
```bash
cd server
npm start
```

**Terminal 2 - Frontend:**
```bash
cd client
npm start
```

Відкрийте: `http://localhost:3000`

**Тестовий акаунт:**
- 👤 Username: `Dmitro`
- 🔑 Password: `09102014`

---

## Heroku

### Крок 1: Підготовка

```bash
# Встановіть Heroku CLI
# https://devcenter.heroku.com/articles/heroku-cli

# Логін
heroku login

# Створіть додаток
heroku create your-app-name
```

### Крок 2: MongoDB Atlas

1. Створіть базу даних на [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
2. Скопіюйте connection string

### Крок 3: Налаштування змінних середовища

```bash
heroku config:set MONGODB_URI="your_mongodb_connection_string"
heroku config:set JWT_SECRET="your_secret_key_here"
heroku config:set NODE_ENV=production
```

### Крок 4: Розгортання

```bash
git push heroku main
# або
git push heroku master
```

### Крок 5: Перевірка

```bash
heroku logs --tail
heroku open
```

---

## Railway

### Крок 1: Реєстрація

1. Перейдіть на [Railway.app](https://railway.app)
2. Зареєструйтеся через GitHub

### Крок 2: Новий проект

1. Натисніть "New Project"
2. Виберіть "Deploy from GitHub repo"
3. Підключіть ваш репозиторій

### Крок 3: Додати MongoDB

1. Натисніть "Add Service"
2. Виберіть "MongoDB"
3. Дозвольте Railway її налаштувати

### Крок 4: Змінні середовища

В Railway Dashboard додайте:

```
MONGODB_URI = ${{ Mongo.DATABASE_URL }}
JWT_SECRET = your_secret_key_here
NODE_ENV = production
```

### Крок 5: Deploy

Railway автоматично розгорне при push на GitHub

---

## Render

### Крок 1: Реєстрація

1. Перейдіть на [Render.com](https://render.com)
2. Зареєструйтеся через GitHub

### Крок 2: Новий Web Service

1. Натисніть "New +"
2. Виберіть "Web Service"
3. Підключіть репозиторій

### Крок 3: Налаштування

```
Name: blackzone-forum
Environment: Node
Build Command: npm install && cd client && npm install && cd ..
Start Command: npm start
```

### Крок 4:환경 переменные

```
MONGODB_URI = your_mongodb_url
JWT_SECRET = your_secret_key
NODE_ENV = production
```

### Крок 5: Deploy

Натисніть "Deploy" і почекайте

---

## Docker Compose

### Крок 1: Встановіть Docker

[Docker Desktop](https://www.docker.com/products/docker-desktop)

### Крок 2: Запуск

```bash
docker-compose up
```

Сервіси будуть доступні на:
- Frontend: `http://localhost:3000`
- Backend: `http://localhost:5000`
- MongoDB: `localhost:27017`

### Крок 3: Зупинка

```bash
docker-compose down
```

---

## 🔍 Перевірка розгортання

Після розгортання перевірте:

1. **Frontend доступний:**
   ```
   curl https://your-domain.com
   ```

2. **Backend OK:**
   ```
   curl https://your-domain.com/api/health
   ```

3. **Вхід Dmitro:**
   - Username: `Dmitro`
   - Password: `09102014`

---

## 🆘 Вирішення проблем

### Помилка MongoDB

```
MongooseError: Cannot connect to MongoDB
```

**Рішення:** Перевірте `MONGODB_URI` та що ваш IP доданий до Atlas

### Помилка CORS

```
Access to XMLHttpRequest blocked by CORS
```

**Рішення:** Переконайтеся, що backend дозволяє requests від frontend

### PORT 5000 вже займаний

```bash
# Знайдіть процес
netstat -ano | findstr :5000

# Завершіть процес
taskkill /PID <PID> /F

# Або змініть PORT в .env
```

---

## 📱 Рекомендовані хостинги (бесплатні):

| Хостинг | Backend | Frontend | БД |
|---------|---------|----------|-----|
| **Heroku** | Платна | Платна | Платна |
| **Railway** | 5$/міс | 5$/міс | Вкл. |
| **Render** | Вкл. | Вкл. | - |
| **Vercel** | - | Вкл. | - |
| **MongoDB Atlas** | - | - | Вкл. |

---

## 📝 Примітки

- Тестувати локально перед розгортанням
- Змінити JWT_SECRET на своє значення в production
- Резервні копії БД регулярно
- Моніторити використання ресурсів

---

Для вопросів звертайтеся до документації на GitHub репозиторії.
