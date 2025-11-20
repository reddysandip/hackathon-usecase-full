FROM node:18-alpine
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci --only=production || npm install --production
COPY src ./src
EXPOSE 3001
CMD [ "node", "src/index.js" ]
