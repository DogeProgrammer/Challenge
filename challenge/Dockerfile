FROM ruby:3.3-bullseye 

# Install system dependencies for building native extensions
# (e.g., Node.js packages)
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn npm
RUN curl -fsSL https://deb.nodesource.com/setup_21.x | bash - &&\
    apt-get install -y nodejs
RUN node -v
RUN npm install -g yarn --force

WORKDIR /app 
COPY . /
RUN ls -la /
COPY Gemfile Gemfile.lock ./
COPY package.json ./
RUN bundle install
RUN yarn install

EXPOSE 3000 
# Change the default command to run your 'bin/dev' script
CMD ["/bin/bash", "-c", "bin/dev"] 