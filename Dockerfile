FROM node:alpine

# fetch latest version of yarn
RUN apk --no-cache add bash curl git tar && \
  curl -o- -L https://yarnpkg.com/install.sh | bash && \
  apk del bash curl tar

# set path to include yarn
ENV PATH /root/.yarn/bin:$PATH

# set working directory
WORKDIR /usr/src/app

# copy package.json and yarn.lock
COPY package.json yarn.lock /usr/src/app/

# copy source
COPY . /usr/src/app

# install dependencies
RUN npm install

# test and build app
RUN npm run test \
  && npm run build

# start server
EXPOSE 3000
CMD ["npm", "start"]
