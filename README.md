# Bookmark manager Challenge

For the 6th week we will build a web application with a database integrated to store the bookmarks a user wants.

## Challenge 01: Creating User stories

In this challenge we will write our user stories from the specifications required:

- Show a list of bookmarks :white_check_mark:
- Add new bookmarks
- Delete bookmarks
- Update bookmarks
- Comment on bookmarks
- Tag bookmarks into categories
- Filter bookmarks by tag
- Users are restricted to manage only their own bookmarks

We will focus in the first requirement,

>As a user,
So that can remember my favourites web pages,
I'd like see a list of my bookmarks.

With this user story we will draw a rough Domain model. (taken from walkthrough)

![Basic domain](./Domain.png)

## Challenge 04: Setting up a database

>As a user,
So that I can save my favourite website,
I would like to add the site's address and title to bookmark manager.

## challenge 05: Creating Your First Table
The database used is made with PostgreSQL:
To create the database we use:
```psql
CREATE DATABASE "bookmark_manager";
\c bookmark_manager;
```
To create the needed table we run the SQL scripts from /db/migrations in the provided order.

## Challenge 10: Creating bookmarks

We need to implement the "Add new bookmarks" feature. We start by making a story from this feature:

> As a User,
So I can save my favourite web pages,
I would like to add the site address to the bookmark manager.



### To run the Bookmark Manager app:

```shell
rackup -p 8181
```
To view bookmarks, navigate to `localhost:8181/bookmarks`.

### Database setup
The database used is made with PostgreSQL:
To create the database we use:
```psql
CREATE DATABASE "bookmark_manager";
\c bookmark_manager;
```
To create the needed table we run the SQL scripts from /db/migrations in the provided order.

For the test database:
To create the database we use:
```psql
CREATE DATABASE "bookmark_manager_test";
\c bookmark_manager_test;
```
To create the needed table we run the `test.sql` scripts from /db/migrations in the provided order.


#### tmp

<form action="/bookmarks/add" method="post">
  <label for="bookmark_tittle">
  Bookmark title:
  <input type="text" name="bookmark_tittle"> </label> <br>
    Bookmark address:
    <label for="bookmark_address">
    <input type="text" name="bookmark_address"> </label> <br>

    <input type="submit" value="Add"> <br>
</form>
