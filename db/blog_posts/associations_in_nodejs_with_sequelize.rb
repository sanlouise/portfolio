Blog.create!(
  title: "One-to-many Associations in Node.js with Sequelize",
  body: "<p>In this post, I am building associations between users and todo items within a Node JS Todo app using SQlite for local production and Postgres for production in Heroku. I use Express, and installed Sequelize as well. You can use my <a href=“https://www.github.com/sanlouise/node-todo-api”>GitHub repo</a> if things are unclear.</p>\r\n\r\n<p>Building associations is pretty easy with the inbuilt methods of Sequelize. Let’s see a very simple one-to-many association in practice. We have users, and each user can create many todo items. </p>\r\n\r\n<h4 class=“center”>The Database</h4>\r\n\r\n<p>My db.js file looks like this. \r\n\r\n<pre><code>var Sequelize = require('sequelize');\r\nvar env = process.env.NODE_ENV || 'development';\r\nvar sequelize;\r\n\r\nif (env === 'production') {\r\n\tsequelize = new Sequelize(process.env.DATABASE_URL, {\r\n\t\tdialect: 'postgres'\r\n\t});\r\n} else {\r\n\tsequelize = new Sequelize(undefined, undefined, undefined, {\r\n\t\t'dialect': 'sqlite',\r\n\t\t'storage': __dirname + '/data/dev-todo-api.sqlite'\r\n\t});\r\n}\r\n\r\nvar db = {};\r\n\r\ndb.todo = sequelize.import(__dirname + '/models/todo.js');\r\ndb.user = sequelize.import(__dirname + '/models/user.js');\r\ndb.sequelize = sequelize;\r\ndb.Sequelize = Sequelize;\r\n\r\ndb.todo.belongsTo(db.user);\r\ndb.user.hasMany(db.todo);\r\n\r\nmodule.exports = db;</pre></code></p>\r\n\r\n<p>Most of this file is dedicated to setting up the right database environment. You can also see how both the todo and user models are referenced here. However, most important for now, I wrote <code>db.todo.belongsTo(db.user)</code> and <code>db.user.hasMany(db.todo)</code>. This is were the associations are set up.</p>\r\n\r\n<h4 class=“center”>Recreate Database Tables</h4>\r\n\r\n<p>To create new associations, we want to create new database tables. Of course, dropping tables is not a good idea on most running applications, and Sequelize does support migrations. It is possible to make changes like renaming a column or adding/removing columns. More info on migrations in Sequelize can be found <a href=“http://docs.sequelizejs.com/en/latest/docs/migrations/”>here</a>.</p>\r\n\r\n<p>In server.js, do something like this to enforce this. <code><pre>db.sequelize.sync({force: true}).then(function() {\r\n\tapp.listen(PORT, function() {\r\n\t\t//code here\r\n\t});\r\n});</pre></code></p>\r\n\r\n<h4 class=“center”>CRUD</h4>\r\n<p>We have a very simple CRUD todo app. Users can create, read, update and delete todo items. </p>\r\n\r\n<h5 class=“center”>POST</h5>\r\n\r\n<p>Initially, I started out with the following POST request. You might notice I am using underscoreJS and body-parser. I’ll skip over those libraries as I merely want to demonstrate how I updated my code to make a working association.</p>\r\n\r\n<code><pre>app.post('/todos', middleware.requireAuthentication, function(req, res) {\r\n\tvar body = _.pick(req.body, 'description', 'completed');\r\n\r\n\tdb.todo.create(body).then(function(todo) {\r\n\t\tres.json(todo.toJSON());\r\n\t}, function(e) {\r\n\t\tres.status(400).toJSON(e);\r\n\t});\r\n\r\n});</pre></code>\r\n\r\nThis piece of code allows logged in users to create todo items with whitelisted parameters (whitelisting happens here with the ._pick method.</p>\r\n\r\n<p>Before updating this method, it is important to note the <code>requireAuthentication</code> method, which I put in a separate custom middleware file.</p>\r\n\r\n<p>This middleware.js file looks like this:\r\n\r\n<code><pre>module.exports = function (db) {\r\n    return {\r\n        requireAuthentication: function (req, res, next) {\r\n            var token = req.get('Auth');\r\n\r\n            db.user.findByToken(token).then(function (user) {\r\n                req.user = user;\r\n                next();\r\n            }, function () {\r\n                res.status(401).send();\r\n            });\r\n        }\r\n    };\r\n};</pre></code></p>\r\n\r\n<p>It is because of this line: <code>req.user = user</code> that we can now create the association in the following way:</p>\r\n\r\n<p>In the POST request, change <code>res.json(todo.toJSON())</code> to <code><pre>req.user.addTodo(todo).then(function () {\r\n    return todo.reload();\r\n}).then(function (todo) {\r\n    res.json(todo.toJSON());\r\n});</pre></code> The ‘add’ method is given by Sequelize.</p>\r\n\r\n\r\n<h5 class=“center”>GET /todos</h5>\r\n\r\n<p>Of course we only want the todo items to be visible to the user if he or she is the creator. We need to update out code to ensure that this is enforced. This is the initial GET request.\r\n\r\n<code><pre>app.get('/todos', middleware.requireAuthentication, function(req, res) {\r\n\tvar query = req.query;\r\n\tvar where = {};\r\n\r\n\tif (query.hasOwnProperty('completed') && query.completed === 'true') {\r\n\t\twhere.completed = true;\r\n\t} else if (query.hasOwnProperty('completed') && query.completed === 'false') {\r\n\t\twhere.completed = false;\r\n\t}\r\n\tif (query.hasOwnProperty('q') && query.q.length > 0) {\r\n\t\twhere.description = {\r\n\t\t\t$like: '%' + query.q + '%'\r\n\t\t};\r\n\t}\r\n\r\n\tdb.todo.findAll({\r\n\t\twhere: where\r\n\t}).then(function(todos) {\r\n\t\tres.json(todos);\r\n\r\n\t}, function(e) {\r\n\t\tres.status(500).send();\r\n\t})\r\n});</pre></code></p>\r\n\r\n<p>There is only a small modification needed. Update <code>var where = {}</code> with the following:\r\n\r\n<code><pre>var where = {\r\n    userId: req.user.get(‘id’)\r\n};</pre></code> \r\n\r\nThis should now only return the todo items of the current user!</p>\r\n\r\n<h5 class=“center”>GET /todos/:id </h5>\r\n\r\n<p>The code to retrieve individual todo items looked like this: <code><pre>app.get('/todos/:id', middleware.requireAuthentication, function(req, res) {\r\n\r\n\tvar todoId = parseInt(req.params.id, 10);\r\n\tdb.todo.findById(todoId).then(function(todo) {\r\n\t\tif (!!todo) {\r\n\t\t\tres.json(todo.toJSON());\r\n\t\t} else {\r\n\t\t\tres.status(404).send();\r\n\t\t}\r\n\t}, function(e) {\r\n\t\tres.status(500).send();\r\n\t});\r\n\r\n});</pre></code></p>\r\n\r\n<p>Update the code to match this:\r\n\r\n<code><pre>app.get('/todos/:id', middleware.requireAuthentication, function(req, res) {\r\n\tvar todoId = parseInt(req.params.id, 10);\r\n\tdb.todo.findOne({\r\n\t\twhere: {\r\n\t\t\tid: todoId,\r\n\t\t\tuserId: req.user.get('id')\r\n\t\t}\r\n\t}).then(function(todo) {\r\n\t\tif (!!todo) {\r\n\t\t\tres.json(todo.toJSON());\r\n\t\t} else {\r\n\t\t\tres.status(404).send();\r\n\t\t}\r\n\t}, function(e) {\r\n\t\tres.status(500).send();\r\n\t});\r\n});</pre></code>\r\n\r\nNow only the right users can access individual items.</p>\r\n\r\n\r\n\r\n<h5 class=“center”>DELETE /todos/:id </h5>\r\n\r\n<p>We can do something very similar for our DELETE method. This is how our code looks now:\r\n\r\n<code><pre> app.delete('/todos/:id', middleware.requireAuthentication, function(req, res) {\r\n\tvar todoId = parseInt(req.params.id, 10);\r\n\r\n\tdb.todo.destroy({\r\n\t\twhere: {\r\n\t\t\tid: todoId\r\n\t\t}\r\n\t}).then(function(rowsDeleted) {\r\n\t\tif (rowsDeleted === 0) {\r\n\t\t\tres.status(404).json({\r\n\t\t\t\terror: 'No todo with id'\r\n\t\t\t});\r\n\t\t} else {\r\n\t\t\tres.status(204).send();\r\n\t\t}\r\n\t}, function() {\r\n\t\tres.status(500).send();\r\n\t});\r\n});</pre></code></p>\r\n\r\n<p> Our code only needs one more line to guarantee that users can only delete their own items. Add a comma right after <code>id: todoId</code> and add <code>userId: req.user.get(‘id’);</code>.</p>\r\n\r\n<h5 class=“center”>PUT /todos/:id </h5>\r\n\r\n<p>Lastly, we need to ensure that users can only modify items that they created. This is our code now:\r\n\r\n<code><pre>app.put(‘/todos/:id', middleware.requireAuthentication, function(req, res) {\r\n\tvar body = _.pick(req.body, 'description', 'completed');\r\n\tvar attributes = {};\r\n\tvar todoId = parseInt(req.params.id, 10);\r\n\r\n\tif (body.hasOwnProperty('completed')) {\r\n\t\tattributes.completed = body.completed;\r\n\t}\r\n\tif (body.hasOwnProperty('description')) {\r\n\t\tattributes.description = body.description;\r\n\t}\r\n\r\n\tdb.todo.findById(todoId).then(function(todo) {\r\n\t\tif (todo) {\r\n\t\t\treturn todo.update(attributes);\r\n\t\t} else {\r\n\t\t\tres.status(404).send();\r\n\t\t}\r\n\t}, function() {\r\n\t\tres.status(500).send();\r\n\t})\r\n\r\n\t.then(function(todo) {\r\n\t\tres.json(todo.toJSON());\r\n\r\n\t}, function(e) {\r\n\t\tres.status(400).json(e);\r\n\t});\r\n});</pre></code>\r\n\r\nLuckily, there is not much that needs to change. We should do the exact same thing we did when getting individual todo items. Replace <code>db.todo.findById(todoId).then(function(todo)</code> to match the following:\r\n\r\n<code><pre>db.todo.findOne({\r\n    where: {\r\n        id: todoId,\r\n        userId: req.user.get('id')\r\n    }\r\n</pre></code></p>\r\n\r\n\r\n<p>This should do the job!</p>\r\n\r\n<h4 class=“center”>Test in Postman</h4>\r\n<p>If you want to, you can test the association using <a href=“https://www.getpostman.com”>Postman</a>, one of my favorite tools!</p> <p>I require a user to log in prior to adding todo items, so I make sure to first launch a POST user request to add a user. Then, I launch another POST request to log the user in, after which I can POST a todo! </p> <p>Let’s assume you create the following todo item:\r\n<code><pre>{\r\n    \"description\": \"Go for a spin\",\r\n    \"completed\": true\r\n}</pre></code>\r\n\r\nSending off this request should result in JSON that includes the following params: an id, description, completed, createdAt, updatedAt and… you should also see a userId param here! Once you get this to work, you have successfully implemented the association! Of course you should also test the other methods to ensure you’ve done everything correcty.</p>\r\n\r\n<p>The official documentation on associations with Sequelize can be found <a href=“http://docs.sequelizejs.com/en/latest/docs/associations/”>here</a>. </p>\r\n\r\n<p>This post was inspired by the the Complete Node JS Developer Course taught by Andrew Mead.</p>",
  topic: "Javascript",
  created_at: "2016-06-10"
)