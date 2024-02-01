# README

This is the Programming Posts small app. You can create and update Posts. Both creat and update actions on Posts are tracked - saved into database. Once the Post is published, the author's followers will receive email about new post publication, locally it is used `letter-opener` gem for opening emails.

To keep simplicity creating users and following users functionalities were not implemented on UI but backend logic for "follow" functionality was implemented. And also, `rails db:seed` provides well enough data for testing purposes.

Rubocop was integrated to keep the codebase in standard. More rubocop customization can be applied to keep codebase more clean.

RSpec was set up. Model, Controller, Service, Worker and User Mailer specs were added.

Different kind of ruby gems were used depending on needs during development.

### Local environment versions

* Ruby version - 3.0.3

* Node version - 21.4.0

* Yarn version - 1.22.10

* PostgreSQL - 13.0

> NOTE! - make sure redis server and sidekiq are running locally

#### Once all tools are installed

> 1 - clone the repository\
> 2 - `bundle install`\
> 3 - `bin/setup` (yarn optional)\
> 4 - `createuser programming_posts -s`\
> 4 - `rails db:create`\
> 5 - `rails db:migrate`\
> 6 - `rails db:seed` (Use following cridentials for best user experience - `abdu@example.com` & `password`)\
> 7 - `bin/dev` to run app (runs Procfile.dev)

