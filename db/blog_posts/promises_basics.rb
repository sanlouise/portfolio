Blog.create!(
  title: "Promises Basics",
  body: "<h4 class=“center”>What Are Promises?</h4>\r\n\r\n<p>Promises are a design pattern to deal with asynchronous Javascript. They are a great alternative to normal callback functions. Callbacks work great with simple asynchronous requests, for instance as success handlers using AJAX requests. Asynchronous Javascript can get much more convoluted than this, making multiple requests at the same time. Promises make it easier to handle multiple asynchronous requests and can make a codebase significantly cleaner. Although some external API’s handling Promises have been around for a while longer, Promises were introduced natively with ES2015. This is the definition of a Promise according to <a href=//developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Promise>the official Mozilla documentation</a>:\r\n\r\n<p>The Promise object is used for asynchronous computations. A Promise represents an operation that hasn't completed yet, but is expected in the future.</p>\r\n\r\n<p>Do not confuse Promises with Promises libraries like Q or Bluebird. These are just implementations of the Promises design pattern. In <a href=//github.com/sanlouise/node-promises-libraries/blob/master/promises.js>this repo</a> I’ve compared these different design patterns. The different Promises libraries all use the specifications of <a href=//promisesaplus.com/>Promisesaplus</a>.</p>\r\n\r\n<p>Although Promises might seem confusing at first, they really are an amazing alternative to callback functions. Once the concept clicks, you probably want to use them all the time.</p>\r\n\r\n<h4 class=“center”>Promises in Practice</h4>\r\n\r\n<p>We can interpret Promise Objects like a progress bar. It is a physical representation of something that is still in progress. The task might not have finished yet, and its data might still be inaccessible to further run operations on, but we do want a physical representation of that ‘in-progress’ function so we can write logic around it.</p>\r\n\r\n<p>For instance, if you have three independent asynchronous tasks running, and you want to do something with the outcome of those three tasks combined, it would be nice to already have logic in place to deal with this outcome. With callbacks, we wouldn’t have access to this Object that is still in progress.</p>\r\n\r\n<p>Javascript Promises have two properties: a state and a value. By default, Promises have a state of ‘pending’ and a value of ‘undefined’. Valid states are ‘pending’, ‘fulfilled’, and ‘rejected’. When we say that a Promise is ‘settled’, it just means that it is no longer pending and has either been fulfilled or rejected.</p>\r\n\r\n<p>It is important to know that once the state of a Promise is different from ‘pending’, it cannot go back and change its value. It is either fulfilled (resolved) or rejected and there is no way of going back.</p>\r\n\r\n<code><pre>var promise = {\r\n    var example = new Promise {\r\n        function(resolve, reject) {\r\n            resolve();\r\n        }\r\n    };\u2028    \r\n    then: function () {},\r\n    catch: function () {}\r\n}</pre></code>\r\n\r\n<p>The image below (taken from <a href=//developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Promise>the Mozilla documentation</a>) visually represents the flow of Promises. This chaining of operations is called ‘composition’.</p>\r\n\r\n<img src=\"https://mdn.mozillademos.org/files/8633/promises.png\" alt=“JS Promises\" style=\"width:600px;height:270px;\">\r\n\r\n<h5 class=“center”>Resolve</h5>\r\n<p>The <code>resolve</code> function tells the Promise Object that it is no longer in progress, it is finished and has returned a value. It notifies any dependent functions that they can now execute using the returned value of the Promise. Once the Promise is resolved, the <code>then</code> function is triggered with the value that was returned with <code>resolve</code>. So, the <code>then</code> function is called whenever the Promise was successfully executed.</p>\r\n\r\n<h5 class=“center”>Reject</h5>\r\n<p>The <code>reject</code> function tells the Promise Object that it is no longer in progress, however it has not returned a valid value. Instead, it has returned an error reason. After the Promise is rejected, we are directed into the <code>catch</code> function. Our Error was caught and handled - the <code>then</code> functions following the Error will never be executed.</p>\r\n",
  topic: "JavaScript",
  created_at: "2016-07-06"
)