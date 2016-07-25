user = User.first

user.blogs.create!(
  title: "The Pseudo-Classical Pattern",
  body: "<section class=\"blog-font blog-post\">\r\n<p></p>\r\n\r\n<h4></h4>\r\n  \r\n<p>Pseudoclassical code is just another layer of convenience on top of the prototypal pattern.\r\nThe difference between pseudoclassical and prototypal code lies with optimization.</p>\r\n<p>In this post, we will be refactoring the code from my <a href=\"http://www.sandrahallie.com/blogs/3\">previous blog post on \r\nprototypal classes</a>. This is what we have so far: </p>\r\n\r\n<p>library.js</p> \r\n<pre><code>var Tiger = function(loc) {\r\n  var obj = Object.create(Tiger.prototype);\r\n  obj.loc  = loc\r\n  return obj;\r\n};\r\n\r\nTiger.prototype.move = function() {\r\n  this.loc++\r\n};\r\n</code></pre>\r\n\r\n<p>run.js</p>\r\n<pre><code>var bobo = Tiger(2);\r\nbobo.move();\r\nvar nola = Tiger(7);\r\nnola.move();\r\n</code></pre>\r\n\r\n<p>With the current code, there would still be a lot of duplication if we were to \r\nmake a lot of classes. Some of the code above will likely show up in new classes.\r\nSpecifically, we can expect <code>var obj = Object.create(Tiger.prototype);</code> and \r\n<code>return obj</code> to appear in all of our classes. Using the pseudoclassical \r\npattern, we can eliminate such unnecessary repetition. </p> \r\n\r\n<h4>The 'new' keyword</h4>\r\n<p>Let's modify our run.js to match this code:</p>\r\n\r\n<pre><code>var bobo = new Tiger(2);\r\nbobo.move();\r\nvar nola = new Tiger(7);\r\nnola.move();\r\n</code></pre>\r\n\r\n<p>When putting the keyword <code>new</code> in front of a class name, our code will be \r\nexecuted in a special mode: the constructor mode.</p>\r\n\r\n<h5>The Constructor Mode</h5>\r\n\r\n<p>The constructor automatically takes care of code that we otherwise would have to repeat.\r\nPrecisely, it inserts invisible lines of code onto the beginning and end of a class.</p>\r\n\r\n<p>At the beginning it creates an object that degelates to Tiger.prototype:</p>\r\n<pre><code>this = Object.create(Tiger.prototype);</code></pre>\r\n<p>At the end:</p>\r\n<pre><code>return this;</code></pre>\r\n\r\n<p> Really, although you won't see the actual code on your screen, it sure is run - but note, \r\nonly when you invoke a function with the <code>new</code> keyword!</p>\r\n\r\n<p>Now we can refactor our code so we get rid of the duplication the constructor causes.</p>\r\n\r\n<pre><code>var Tiger = function(loc){\r\n  this.loc = loc;\r\n};\r\n\r\nTiger.prototype.move = function() {\r\n  this.loc++\r\n};\r\n</code></pre>\r\n\r\n<h5>Unique versus shared code</h5>\r\n\r\n<p>It is important to understand the difference between the functions of the class and prototype.\r\nThe class embodies code that is unique to single instances, whereas the prototype really only exists \r\nto keep shared code that multiple instances use in one place. </p>\r\n\r\n<i>This post was inspired by the course on Object-Oriented Javascript by Udacity and Hack Reactor.</i>\r\n  \r\n</section>",
  topic: "Javascript",
  created_at: "2016-04-01"
)