user = User.first

user.blogs.create!(
  title: "Callback Functions",
  body: "<p>Callback functions are super important when working with asynchronous requests in Javascript. During my online courses, they were repeatedly mentioned without much attention and they quickly became quite confusing. Their concept, however,  is not too complex and very useful!</p>\r\n\r\n<h4 class=“center>What are Callback functions?</h4>\r\n\r\n<p>A callback function is a function that you give to another function, to be run when the other function has been executed. In other words, the function you call, ‘calls back’ by invoking the function you gave it when it was executed.</p> \r\n<p>For example, I have function A and I give it function B. When function A is executed, it then calls function B. It is this principle where the name ‘callback’ function comes from!</p>\r\n\r\n<h5 class=\"center\">Let’s Get to Practice!</h5>\r\n\r\n<pre><code>function alertWhenFinished(callback) {\r\n\tvar students = 2500;\r\n\tvar teachers = 75;\r\n\t\r\n\tcallback(); // This is the callback function that runs the function we pass to it below!\r\n}\r\n\r\nalertWhenFinished(function() {\r\n\talert(‘Finished!’);\r\n});</code></pre>\r\n\r\n<p> Note that our function takes ‘callback’, but you can really call it however you want.</p>\r\n\r\n<h5 class=\"center\">What’s Happening?</h5>\r\n\r\n<p>Our callback function will run <code>alert(‘Finished!’);</code>, it is called back! The anonymous function that causes the alert to pop up, is moved into the variable parameter (callback) of the alertWhenFinished function when the callback function is invoked. </p>\r\n\r\n<p>Let’s see another example!</p>\r\n\r\n<pre><code>function fullName(firstName, lastName, callback) {\r\n\tconsole.log(\"My name is \" + firstName + \" \" + lastName);\r\n\tcallback(lastName);\r\n}\r\n\r\nvar greeting = function(ln){ // ln, short for last name.\r\n\tconsole.log('Hello Mr. ' + ln);\r\n};\r\n\r\nfullName(\"John\", \"Doe\", greeting);</code></pre>\r\n\r\n<p>This prints:</br> My name is John Doe. </br>Hello Mr. Doe.</p>\r\n\r\n<h5 class=\"center\">What’s Happening?</h5>\r\n\r\n<p>Here we see two levels of invocation.</p> \r\n<p>First, the three parameters of the fullName() invocation move to the parameter variables of the function fullName(). In other words, it moves the greeting variable that contains the anonymous function to the callback variable. Simultaneously, it moves \"John\" to firstName variable, and \"Doe\" to the lastName variable.</p>\r\n<p>Then, the callback() invocation invokes the anonymous function contained within the greeting variable. Now the parameter of the callback() invocation, which is lastName, moves into the ln parameter variable of the anonymous function. Now the ln variable contains the lastName variable, which is “Doe”. Lastly, the invocation of the anonymous function outputs the result, which includes the ln variable containing lastName variable “Doe”.</p>\r\n\r\n<h5 class=\"center\">Recommended Further Reading</h5>\r\n\r\n<li>http://callbackhell.com</li>\r\n<li>https://strongloop.com/strongblog/node-js-callback-hell-promises-generators/</li>\r\n",
  topic: "Javascript",
  created_at: "2016-04-13"
)