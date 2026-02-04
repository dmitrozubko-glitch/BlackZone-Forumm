#!/bin/bash

echo "🚀 BlackZone Forum - Heroku Deployment"
echo "======================================"
echo ""

# Check if Heroku CLI is installed
if ! command -v heroku &> /dev/null; then
    echo "❌ Heroku CLI is not installed!"
    echo "📥 Download from: https://devcenter.heroku.com/articles/heroku-cli"
    exit 1
fi

echo "✅ Heroku CLI found"
echo ""

# Login to Heroku
echo "🔐 Logging into Heroku..."
heroku login

# Get app name
read -p "📱 Enter your Heroku app name (or create new): " APP_NAME

if [ -z "$APP_NAME" ]; then
    echo "❌ App name is required!"
    exit 1
fi

# Create app if it doesn't exist
heroku apps:info -a $APP_NAME > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "📝 Creating new Heroku app: $APP_NAME"
    heroku create $APP_NAME
fi

echo ""
echo "🗄️  Setting up MongoDB Atlas..."
echo "1. Go to https://www.mongodb.com/cloud/atlas"
echo "2. Create a cluster and get the connection string"
echo ""
read -p "📋 Paste your MongoDB connection string: " MONGODB_URI

if [ -z "$MONGODB_URI" ]; then
    echo "⚠️  Using default MongoDB (won't work in production)"
    MONGODB_URI="mongodb://localhost:27017/blackzone-forum"
fi

# Generate JWT Secret
JWT_SECRET=$(openssl rand -base64 32)

echo ""
echo "⚙️  Setting environment variables..."
heroku config:set -a $APP_NAME MONGODB_URI="$MONGODB_URI"
heroku config:set -a $APP_NAME JWT_SECRET="$JWT_SECRET"
heroku config:set -a $APP_NAME NODE_ENV=production

echo ""
echo "📤 Deploying to Heroku..."
git push heroku main

echo ""
echo "✅ Deployment complete!"
echo "🌐 Your app is available at: https://${APP_NAME}.herokuapp.com"
echo ""
echo "📊 View logs:"
echo "   heroku logs -a $APP_NAME --tail"
echo ""
echo "🔓 Test Account:"
echo "   Username: Dmitro"
echo "   Password: 09102014"
