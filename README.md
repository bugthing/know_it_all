Know It All
===========

A system to simplify recording and accessing documentation.

Setup
-----

### DB (postgres)

Use docker containers ftw!

Run the server:

    $ docker run -d --name postgres -p 5432:5432 -v /store/pgdata:/var/lib/postgresql/data -e POSTGRES_PASSWORD=postgres postgres

Connect to the server:

    $ docker run -it --rm --name postgres-client --link postgres:postgres postgres psql -h postgres -U postgres -W

### Application

    $ bundle install
    $ yarn install

#### Rails

    $ ./bin/rails db:drop db:create db:migrate
    $ ./bin/rails server -p 3001

#### Slack Bot

Run the bot like so:

    $ ./bin/rails runner ./bin/bot.rb

Dev tasks
---------

Make use of Rails encrypted secrets

    $ bin/rails credentials:edit

