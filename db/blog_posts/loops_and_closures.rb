Blog.create!(
  title: "Loops & Closures",
  body: "<p>Let’s look at a common mistake using loops and closures. What we want to do here is assign a seat to students. Their seat number should be equal to their index plus 1.</p>\r\n\r\n<h4 class=“center”>An easy mistake</h4>\r\n\r\n<code><pre>function assignSeating (name, studentArray) {\r\n    var seatAssignment;\r\n    for (var i = 0; i < studentArray.length; i++) {\r\n        if (studentArray[i] == name) {\r\n            seatAssignment = function () {\r\n                alert(“Hello, “ + name +  “. Please go to seat number “ + (i+1) + “.”); \r\n            };\r\n        }\r\n    }\r\n    return seatAssignment;\r\n}</pre></code>\r\n\r\n<p>When the right name is found, a function is made holding the seat assignment closure. We assign a person to the seat matching their index value in the studentsArray(plus 1, adjusted for 0). Lastly, we return seatAssignment to the global scope.</p>\r\n\r\n<p>Imagine we have the following student list:</p>\r\n\r\n<code><pre>var honorsStudents = [“Anna”, “Belle”, “Chris”, “Zach”, “Laura”, “Lydia”, “Clio”, “Peter”];</pre></code>\r\n\r\n<p>Also, we’ll create a new variable that holds our assignSeating function so we can pass in a student name and a list of students to loop over.</p>\r\n\r\n<code><pre>var passAssignment = assignSeat(“Lydia”, honorsStudents);\r\npassAssignment();</pre></code>\r\n\r\n<h5>Expectation vs. Reality</h5>\r\n<p>Running <code>passAssignment</code>, you might expect the following to pop up: <i>Hello, Lydia. Please go to seat number 6.</i></p>\r\n\r\n<p>Instead, you will see this: <i>Hello, Lydia. Please go to seat number 9.</i></p>\r\n\r\n<h5>Why This Happened</h5>\r\n<p>This is not want we want! What happened? We did not take into consideration that closures bind values at the last moment. We need to pay extra attention to where we return out final functions. The moment we return the function is the same moment when the values of all necessary variables are decided. In other words, where we see the function return, is the same place where the actual closure occurs.</p>\r\n\r\n<p>We got the 9 instead of the 6 here because before seatAssignment is returned, the <code>i</code> loop counter has increased to 8 and then stopped the loop. Of course, 8 + 1 = 9. </p>\r\n\r\n<h4 class=“center”>A Correct Approach</h4>\r\n\r\n<p>We need to establish a way so that the correct value is returned. There are a couple of ways to go about this. This is one way:</p>\r\n\r\n<code><pre>function assignSeating (name, studentArray) {\r\n    for (var i = 0; i < studentArray.length; i++) {\r\n        if (studentArray[i] == name) {\r\n            return function () {\r\n                alert(“Hello, “ + name +  “. Please go to seat number “ + (i+1) + “.”); \r\n            };\r\n        }\r\n    }\r\n}\r\nvar honorsStudents = [“Anna”, “Belle”, “Chris”, “Zach”, “Laura”, “Lydia”, “Clio”, “Peter”];\r\n\r\nvar passAssignment = assignSeat(“Lydia”, honorsStudents);\r\npassAssignment();</pre></code>\r\n\r\n<p>If we run this code, we do get the expected result: “Hello, Lydia. Please go to seat number 6.” We get the correct output because our loop counter was not allowed to loop all the way to the end.</p>\r\n\r\n<h4 class=“center”>Another Correct Approach</h4>\r\n\r\n<p>We can also go about this in a different way. Below, we allow our function to only take in the studentsArray and then let the returned function take in a specific name. Our loop is now inside the function expression.</p>\r\n\r\n<code><pre>function makeSeatAssigner (studentArray) {\r\n    return function (name) {\r\n        for (var i = 0; i < studentArray.length; i++) {\r\n        if (studentArray[i] == name) {\r\n            return function () {\r\n                alert(“Hello, “ + name +  “. Please go to seat number “ + (i+1) + “.”); \r\n            };\r\n        }\r\n    }\r\n}\r\n\r\nvar honorsStudents = [“Anna”, “Belle”, “Chris”, “Zach”, “Laura”, “Lydia”, “Clio”, “Peter”];\r\n\r\nvar getSeatFor = makeSeatAssigner(honorsStudents);\r\ngetSeatFor(“Lydia”);</pre></code>\r\n\r\n<p>We’ve put the for-loop inside the returned function, ensuring that <code>i</code> comes from that local scope. And again, if we run this code, we will get the expected outcome: “Hello, Lydia. Please go to seat number 6.”</p>\r\n",
  topic: "Javascript",
  created_at: "2016-06-27"
)