#!/usr/bin/env bash

# Install Ruby Gems & Node packages
bundle install && yarn install

# Generate a .env from the sample file
cp .env.sample .env
cp config/database.yml.example config/database.yml

# Setup database
bundle exec rails db:setup

# Run Posterr
bundle exec rails s
