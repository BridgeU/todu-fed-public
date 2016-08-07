# To-dü
## Instructions

We've been working on a side project – a to-do list app that students might end
up using to keep track of things they need to do during their application
process. The backend is developed now.

We were hoping you could take a couple of hours (NOTE: it's up to you, but we're
not expecting this to take up too much of your time) to write a front-end for
it. We're not expecting anything beautiful, just a responsive wireframe so that
we can show our work to the first schools that will use this feature.

To-dü flows
--
1. A user can create a new todo list, and give it a name.
1. A user can view any of their created lists.
1. A user can add a todo item to a todo list.
1. Existing todo items can be marked as complete

It's also possible to create accounts, log in, update the name of a todo list,
delete a list, update todo items, and destroy them.
But we can leave those until the second release of the feature, so only do them
if you have time.

```
From: Test Team <test@bridge-u.example>
To: You <you@bridge-u.example>
Subject: Backend is done!

We've got the project hosted at: http://todu-fed.herokuapp.com
And here's an auth token for a sample user:
eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MDg5NDA4MTd9.4foJ8T2LUQur0xcsnwEvcGAlGkjRdL5fV52igzXSNSE

Here's some samples from the backend API so you can get going on a frontend to
work with it.

- Requests that aren't authorized will respond with a 403 status, and a JSON
object with a single "message" key.
- If you leave out a base parameter, you'll get a 400 bad request (e.g. if your
POST to create a list leaves out the todo_list parameter).
- If you submit an invalid entity, you'll get a 422 unprocessable entity, with
a dictionary of {field: [error messages]}. E.g.
$ curl -X POST -H "Content-type: application/json" -H "Authorization: Bearer <auth_token>" -d '{"todo_list": {"name": ""}}' http://todu-fed.herokuapp.com/api/lists
=> {"name":["can't be blank"]}

# Registration
$ curl -X POST -H "Content-type: application/json" -d '{"user": {"email": "test@test.com", "password": "Password"}}'  http://<domain>/api/users
=> {"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1MDg5Mjc5NjZ9.eO2jxYWtQ7BTIooTyTh6i6PIUj8plOOhqDU3nFq2kbw","email":"test@test.com"}

# Sign in (will respond with status 406 if credentials are invalid)
$ curl -X POST -H "Content-type: application/json" -d '{"user": {"email": "test@test.com", "password": "Password"}}'  http://<domain>/api/users/sign_in
=> {"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1MDg5Mjk2NTl9.dAh6b1TY1OnjAN912RzpHrGzgFAm4wQsdPmF8IlVw4U"}

# Create a list
$ curl -X POST -H "Content-type: application/json" -H "Authorization: Bearer <auth_token>" -d '{"todo_list": {"name": "Shopping List"}}'  http://<domain>/api/lists
=> {"id":6,"name":"Shopping List","created_at":"<timestamp>","updated_at":"<timestamp>","user_id":4}

# Index all lists
$ curl -X GET -H "Content-type: application/json" -H "Authorization: Bearer <auth_token>" http://<domain>/api/lists
=> [{"id":3,"name":"Chopin Liszt","created_at":"<timestamp>","updated_at":"<timestamp>","user_id":4},{"id":6,"name":"Shopping List","created_at":"<timestamp>","updated_at":"<timestamp>","user_id":4}]

# Show one list
$ curl -X GET -H "Content-type: application/json" -H "Authorization: Bearer <auth_token>" http://<domain>/api/lists/6
=> {"id":6,"name":"Shopping List","created_at":"<timestamp>","updated_at":"<timestamp>", "user_id":4, "todo_items":[{"id":4,"title":"Cheese","completed":false}]}

# Update a list
$ curl -X PUT -H "Content-type: application/json" -H "Authorization: Bearer <auth_token>" -d '{"todo_list": {"name": "Urgent Shopping List"}}' http://<domain>/api/lists/6
=> {"id":6,"user_id":4,"name":"Urgent Shopping List","created_at":"<timestamp>","updated_at":"<timestamp>"}

# Delete a list
$ curl -X DELETE -H "Content-type: application/json" -H "Authorization: Bearer <auth_token>" http://<domain>/api/lists/4
=> {}

# Create a new item on a list
$ curl -X POST -H "Content-type: application/json" -H "Authorization: Bearer <auth_token>" -d '{"todo_item": {"title": "Beans"}}'  http://<domain>/api/lists/6/items
=> {"id":5,"todo_list_id":6,"title":"Beans","created_at":"<timestamp>","updated_at":"<timestamp>","completed":false}

# Update an item on a list
$ curl -X PUT -H "Content-type: application/json" -H "Authorization: Bearer <auth_token>" -d '{"todo_item": {"title": "Baked Beans"}}'  http://<domain>/api/items/5
=> {"id":5,"todo_list_id":6,"title":"Baked Beans","created_at":"<timestamp>","updated_at":"<timestamp>","completed":false}

# Mark an item on a list as complete
$ curl -X PUT -H "Content-type: application/json" -H "Authorization: Bearer <auth_token>" http://<domain>/api/items/5/mark_complete
=> {"id":5,"todo_list_id":6,"completed":true,"title":"Baked Beans","created_at":"timestamp","updated_at":"timestamp"}

# Show an item from a list
$ curl -X GET -H "Content-type: application/json" -H "Authorization: Bearer <auth_token>" http://<domain>/api/items/5
=> {"id":5,"todo_list_id":6,"title":"Beans","created_at":"<timestamp>","updated_at":"<timestamp>","completed":false}

# Destroy an item from a list
$ curl -X DELETE -H "Content-type: application/json" -H "Authorization: Bearer <auth_token>" http://<domain>/api/items/5
=> {}

```
