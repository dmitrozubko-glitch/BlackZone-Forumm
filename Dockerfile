FROM node:18-alpine

WORKDIR /app

# Copy all files first
COPY . .

# Install server dependencies
RUN cd server && npm install && cd ..

# Install client dependencies and build
RUN cd client && npm install && npm run build && cd ..

EXPOSE 5000

ENV NODE_ENV=production

CMD ["npm", "start"]
