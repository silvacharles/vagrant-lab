FROM node:alpine

WORKDIR /usr/app
COPY package.json ./
RUN npm install
COPY . .
CMD ["npm", "start"]
# Note: The Dockerfile is set to run a Node.js application with Express and Redis dependencies
# The application will start with the command defined in package.json