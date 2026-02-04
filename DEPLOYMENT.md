# BlackZone Forum - Инструкции по развертыванию

## Локальный запуск

### 1. Установка зависимостей

```bash
# Backend
cd server
npm install

# Frontend
cd ../client
npm install
```

### 2. Настройка переменных среды

Создайте файл `.env` в папке `server`:

```
MONGODB_URI=mongodb+srv://forum:forum123@cluster0.mongodb.net/blackzone-forum?retryWrites=true&w=majority
JWT_SECRET=your_secret_key_here
PORT=5000
NODE_ENV=development
```

### 3. Запуск приложения

```bash
# Terminal 1 - Backend
cd server
npm start

# Terminal 2 - Frontend
cd client
npm start
```

Приложение будет доступно на `http://localhost:3000`

## Развертывание на Heroku

### 1. Подготовка

```bash
heroku login
heroku create your-app-name
```

### 2. Добавьте переменные среды

```bash
heroku config:set MONGODB_URI=your_mongodb_url
heroku config:set JWT_SECRET=your_secret
```

### 3. Deploy

```bash
git push heroku main
```

## Развертывание на Railway

### 1. Создайте проект на Railway
### 2. Подключите GitHub репозиторий
### 3. Добавьте переменные среды в Railway Dashboard
### 4. Сервис будет автоматически развернут

## Развертывание на Render

### 1. Создайте новый Web Service
### 2. Подключите Git репозиторий
### 3. Установите следующие параметры:
   - Build Command: `npm install && cd client && npm install && cd ..`
   - Start Command: `npm start`
### 4. Добавьте переменные среды

## MongoDB Atlas

1. Зарегистрируйтесь на https://www.mongodb.com/cloud/atlas
2. Создайте новый кластер
3. Получите строку подключения
4. Добавьте в переменные среды как `MONGODB_URI`

## Тестовые учетные данные

Username: Dmitro
Password: 09102014

Этот аккаунт имеет все права администратора.
