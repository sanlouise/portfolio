user = User.first

user.blogs.create!(
  title: "Server Setup With Express & Socket.io (1/3)",
  body: "<p>In this post, I will set up a very basic socket.io connection with NodeJS that can be deployed on Heroku. I will walk you through the setup step by step, completely from scratch.</p>\r\n\r\n<h4 class=“center”>Basic Setup</h4>\r\n<p>First, create a new folder wherever you want your code to be stored. Call it something like node-sockets. Navigate here via the terminal. Now run <code>npm init</code>. This will add a package.json file to your folder.</p>\r\n\r\n<p>Now, let’s install ExpressJS. Run <code>npm install express --save</code>.</p>\r\n\r\n<p>Now, manually create a new file in our node-sockets folder and call it server.js. In here, add the following code:\r\n\r\n<code><pre>var PORT = process.env.PORT || 3000;\r\nvar express = require('express');\r\nvar app = express();\r\nvar http = require('http').Server(app);</pre></code></p>\r\n\r\n<p>If you also want to create the front-end of your app, create a new folder right under node-sockets and call it ‘public’. You should now add this code to server.js:\r\n\r\n<code>app.use(express.static(__dirname + ‘/public’));</code> You can now add files to the ‘public’ folder that can be visible to others, for instance index.html.</p>\r\n\r\n<p>Now we are ready to actually start our server.\r\n\r\n<code></pre>http.listen(PORT, function () {\r\n\tconsole.log('Server started!');\r\n});</pre></code> Of course, you can console.log any message you like. It’s just nice to have a confirmation message in your terminal when you start your server successfully.</p>\r\n\r\n<p>To check that your server is now set up correctly, just run <code>node server.js</code> in your terminal. If all is well, you should see the message your chose above printed out.</p>\r\n\r\n<h4 class=“center”>Installing Socket.io </h4>\r\n\r\n<p>In your terminal, run <code>npm install socket.io --save</code>. After this has finished installing, you should add <code>var io = require(‘socket.io’)(http);</code> in your server.js file, right underneath your http variable. This will install the socket.io library into your app. You’ll need the io variable a lot in your app. </p>\r\n\r\n<h5 class=“center”>Listening for Events</h5>\r\n\r\n<p>We can use the io variable to listen for events in our app. For now, let’s make a listener that sends a message when we get a connection from a client. <code><pre>io.on('connection', function () {\r\n\tconsole.log('User is connected via socket.io!');\r\n});</pre></code></p>\r\n\r\n<p>Here you can again console.log any message you want.</p>\r\n\r\n<h4 class=“center”>A Bit of Front-End</h4>\r\n<p>To get the most out of socket.io, we need to take care of a little bit of front-end work. Ensure you have a file called index.html right in your public folder. Also, create a new folder in your public folder. Call it ‘js’.</p> \r\n\r\n<p>Now, let’s install two libraries: socket.io and jQuery. The right file for socket.io can be downloaded <a href=\"http://cdn.socket.io/socket.io-1.3.7.js\">here</a>. Add this file into your public/js folder.</p>\r\n\r\n<p>You can download jQuery right off <a href=\"http://jquery.com”>their website</a>, I used the compressed production file with version 2.2.4. Save this file in your /public/js folder as well.</p>\r\n\r\n<p>I’ve created a very simple, extremely basic HTML template that should do the job for now. Make sure your index.html file looks something like this:\r\n\r\n<code><pre><xmp><!DOCTYPE html>\r\n<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <title>Simple socket.io App</title>\r\n    </head>\r\n    <body>\r\n        <script src=\"/js/jquery-2.2.4.min.js\"></script>\r\n        <script src=\"/js/socket.io-1.3.7.js\"></script>\r\n        <script type=\"text/javascript\">\r\n            var socket = io();\r\n        </script>\r\n    </body>\r\n</html></xmp></pre></code></p>\r\n\r\n<p>It is always a good idea to move Javascript into a separate file. You should create a new file, /js/app.js, and move <code>var socket = io();</code> there. Now you can also remove <code><xmp><script type=“text/javascript”></xmp></code> as it runs no code anymore.</p>\r\n\r\n<h5 class=“center”>Just One More Thing</h5>\r\n\r\n<p>Now, just to show that our front-end is also seeing the socket.io connection, make your app.js file look like this:<code><pre>var socket = io();\r\nsocket.on('connect', function () {\r\n\tconsole.log('Connected to the socket.io server!');\r\n});</pre></code>\r\n\r\nWhen you run your server and navigate to PORT 3000, you should be able to see the message in the console in your developer tools. Awesome!</p>\r\n\r\n<h4 class=“center”>That was it!</h4>\r\n\r\n<p>Now your code should be ready for the next step: exchanging data via the server to a client. I will discuss this <a href=\"http://www.sandrahallie.com/blogs/24\">here</a>.</p>",
  topic: "JavaScript",
  created_at: "2016-06-16"
)