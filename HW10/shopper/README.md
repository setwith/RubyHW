# README

# Info

- Ruby version 3.1.2
- Ruby on Rails 7.0.4

#

# To get started with the app just:

- clone the repo
<pre> git clone https://github.com/setwith/RubyHW </pre>

- install the required gems (Gemfile)

```ruby
gem install bundler

bundle install
```

- then run

```ruby
rails db:create
rails db:migrate
rails db:seed
rails s
```

# Log in

- to log in as admin visit `http://localhost:3000/admin` and log in as the default user:

`User: admin@example.com`

`Password: password`

- to log in as user visit `http://localhost:3000`

`User: 'user@example.com'`

`Password: password`
