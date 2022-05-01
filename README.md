# Rails Posterr

## Contents
<!--ts-->
- [About the Project](#-about-the-project)
- [Requirements](#-requirements)
- [Features](#-features)
- [How to use the Project](#-how-to-use)
  - [With Docker](#-how-to-use-with-docker)
- [API Documentation](#-api-documentation)
- [Code Quality](#-code-quality)
- [Planning](#-planning)
- [Critique](#-self-critique-and-scaling)
<!--te-->

-----------------------

## 💻 About the project

### Posterr is a social media platform, where you can create posts, follow other people, and interact with them.


-----------------------
## Requirements

- Git
- Ruby 2.7.2
- Rails 6.0.3.5
- PostgreSQL
- Postman or Insomnia

## ⚙️ Features

This template comes with:
- Schema
  - Users table
  - Admin users table
  - Posts Table
- Endpoints
  - CRUD for Posts
  - Sign up with user credentials
  - Sign in with user credentials
  - Sign out
  - Reset password
  - Get and update user profile
- Administration panel for users
- Rspec tests
- Code quality tools
- API documentation following https://apiblueprint.org/
- Docker support
- Exception Tracking
- RSpec API Doc Generator

## 🚀 How to use
```ruby

# Clone this repository
$ git clone git@github.com:luiz-m-affonso/rails-posterr

# Run script for install dependencies
$ sh start.sh

```
## How to use with docker 🎲

1. Have `docker` and `docker-compose` installed (You can check this by doing `docker -v` and `docker-compose -v`)
1. Modify the following lines in the `database.yml` file:
  ``` yaml
  default: &default
    adapter: postgresql
    encoding: unicode
    pool: 5
    username: postgres
    password: postgres
    host: db
    port: 5432
  ```
1. Generate a secret key for the app by running `docker-compose run --rm --entrypoint="" web rake secret`, copy it and add it in your environment variables.
1. Update the default database configuration in the `config/database.yml` file to point to the `docker-compose` database:
   1. Set `username: postgres`
   1. Set `password: postgres`
   1. Set `host: db`
1. Run `docker-compose run --rm --entrypoint="" web rails db:create db:migrate`.
1. Run the application with `docker-compose up`.


## API Docs

## Code quality

With `bundle exec rails code:analysis` you can run the code analysis tool, you can omit rules with:

- [Rubocop](https://github.com/bbatsov/rubocop/blob/master/config/default.yml) Edit `.rubocop.yml`
- [Reek](https://github.com/troessner/reek#configuration-file) Edit `config.reek`
- [Rails Best Practices](https://github.com/flyerhzm/rails_best_practices#custom-configuration) Edit `config/rails_best_practices.yml`
- [Brakeman](https://github.com/presidentbeef/brakeman) Run `brakeman -I` to generate `config/brakeman.ignore`
- [Bullet](https://github.com/flyerhzm/bullet#whitelist) You can add exceptions to a bullet initializer or in the controller

## Planning

## Self Critique & Scaling
