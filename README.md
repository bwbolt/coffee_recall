# Relational Rails - Coffee Recall Portal

---
The Relational Rails project requires **building a relational database** with a one-to-many or parent/child relationship, and utilizing the **Rails framework** to create a website with **CRUD (create, read, update, delete) functionality**.

With this in mind, the Coffee Recall Portal allows users to interact with a database, adding lots and subsequent associated bags, in order to track what bags were made from what lot incase of a needed recall based on health concerns.
Users can:
  - Search for particular lots and particular bags
  - Sort by quantity of bags created from a lot
  - Sort by date created

### Prerequisites

Users will need Ruby 2.7.4 - you can run the following command in your terminal (see https://github.com/rbenv/rbenv if you don't yet have rbenv)

```
rbenv local 2.7.4
```


### Installing

Run the following commands in your terminal to get the project up and running

Clone the project onto your local machine

```
git clone git@github.com:bwbolt/coffee_recall.git
```


Bundle install the associated gems and check for updates

```
bundle install
bundle update
```

## Running the tests

Tests are written in RSpec - run the following command in your terminal to execute all tests

```
bundle exec rspec
```

## Viewing the Website

Start the Rails Server

```
rails s
```

#### Open http://localhost:3000/ in a web browser

Click around and enjoy the extra piece of mind when operating your (coffee) buisness!

# Visual Representation of Database Schema
![image](/lib/assets/images/schema.png)
