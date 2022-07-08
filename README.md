# README

# Requirements:
* Ruby 3.1.0
* Rails 7.0.3

# Instructions:
* Clone this repo
* Run `bundle install`
* Run `rails db:setup db:migrate`
* (Optional) run `rails db:seed` to seed some sample posts
* Run `rails s`
* Connect to application via web browswer on http://127.0.0.1:3000

# Features
* Basic username/password login and authentication
* Unauthenticated users may view posts
* Authenticated users may add posts and edit/delete their own posts
* Users are prevented from editting/deleting other user's posts