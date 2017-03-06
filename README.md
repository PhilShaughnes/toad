# README

This is an API for TOAD, a short message social network where users can post "croaks".

This project was a joint assignment between the front-end and back-end class at The Iron Yard. This code is JUST THE API. The front-end ought to be available at .

## Getting started

To get started, you will need to run `rails db:migrate`.

If you want to seed the database with fake data, you can run `rails db:seed`.

`db:seed`, unless edited, will ensure you have at least 10 users in the database. Each user will have a few posts and should have a few followers and followees. They also should have avatar photos. Each of these is easily changed in the `seeds.rb` file. Simply comment/uncomment the method you with to include/exclude.

## Features

### summary:

- users can signup or login
- without signing up or in, a user can see all posts chronologically.
- A logged in user can:

  - see a timeline of their posts and those of anyone they follow.
  - make posts.
  - search for users or posts.
  - see their own profile.
  - see all posts by specific users.
  - follow/unfollow other users.

### Route Summary

- `post /users` - signup

- `post /login` - login

- `post /posts` - create a post (token required)

- `get /users` - see a list of all users (token required)

- `get /users` - search for users and posts (token and :search parameter required)

- `get /posts` - see a list of all posts (no token)

- `get /posts` - see timeline (token required)

- `get /users/profile` - see your profile (token required)

- `get /users/:id` - see the profile of a specific user (token required)

- `get /post/:user_id` - see all the posts for a specific user (token required)

- `post /socialize/follow` - toggle the follow status of a for the current user, of a specific user (requires a token and a username as parameters)

### Unfinished Features

- robust testing ( or any testing)
- likes
- mentions
- a better readme

<!-- ### Signup Route: `post` request to `/users` Requires: - username - password - first_name - last_name - email Success returns the created user in JSON with a token. Failure returns errors. messages. ### Login Route: `post` request to `/login` Requires: - username - password Success returns the user in JSON with a token. Failure returns an error message. For loggout, front-end simply needs to clear the token. ### Timeline Route: `get` request to `/posts` with a token, returns the timeline. without a token, returns all posts. each post includes the message, username, and photo_url (avatar). ### Posts Route: ### Profile/Other users ### Search ### Follow/Unfollow -->
