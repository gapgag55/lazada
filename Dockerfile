FROM node:18

# Create app directory
WORKDIR /usr/src/app

RUN apt install libnss
RUN apt install libnss3-dev libgdk-pixbuf2.0-dev libgtk-3-dev libxss-dev

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --omit=dev

# Bundle app source
COPY . .

EXPOSE 80
CMD [ "node", "index.js" ]
