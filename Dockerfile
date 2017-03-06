FROM node

# set working directory
WORKDIR /usr/src/app

# copy source
COPY . /usr/src/app

# install dependencies
RUN npm install --silent

# test and build app
RUN npm run test \
  && npm run build

# start server
EXPOSE 3000
CMD ["npm", "start"]
