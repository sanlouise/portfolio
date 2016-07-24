Blog.create!(
  title: "Objects",
  body: "<p>Properties of objects can refer to strings, numbers, arrays, functions, as well as other objects.</p>\r\n\r\n<p>This is an empty object literal:</p>\r\n<code><pre>var myHouse = { };</pre></code>\r\n\r\n<p>We can also assign variables to object properties, like so:</p>\r\n<code><pre>var roomsArray = [“Bedroom”, “Living room”, “Kitchen”, “Bathroom”];\r\n\r\nvar myHouse = {height: 8, width: 10, length: 12, volume: 960, material: “wood”, rooms: roomsArray };</pre></code>\r\n\r\n<h4 class=“center”>Using the Dot Operator</h4>\r\n\r\n<h5 class=“center”>Referencing Properties</h5>\r\n <p>We can access particular properties of objects using the dot operator. So, if we want to retrieve the volume of <code>myHouse</code>, we could just do this: <code>myHouse.volume;</code>. \r\n\r\n<h5 class=“center”>Changing Property Values</h5>\r\n<p>If we now want to update the length of myHouse to 14, we could do it this way: <code>myHouse.length = 14;</code>. This overrides the original value for length. Note that we now also need to update the volume property! To deal with updating values, it is a much better idea to not give volume a static value but do this instead: <code>myHouse.volume - myHouse.length * myHouse.width * myHouse.height;</code>.</p>\r\n\r\n<p>Adding a room to myHouse can be done in a whim. Because <code>myHouse.rooms</code> returns an array we can use array methods. Let’s add a playroom. <code>myHouse.rooms.push(“Playroom”);</code>. We modified the array outside of the <code>myHouse</code> object. We can do this because roomsArray inside of the <code>myHouse</code> object only makes a reference to the external roomsArray - it does not create a newly copied array! To check this, we can return the value of <code>roomsArray</code>.</p>\r\n\r\n<code><pre>return( myHouse.rooms );\r\n// [“Bedroom”, “Living room”, “Kitchen”, “Bathroom”, “Playroom”];\r\n\r\nreturn( roomsArray );\r\n// [“Bedroom”, “Living room”, “Kitchen”, “Bathroom”, “Playroom”];\r\n</pre></code>\r\n\r\n\r\n<h5 class=“center”>Adding Properties</h5>\r\n<p>We can add properties to an object after the object has already been created. If we wanted to add a <code>garden</code> property to our <code>myHouse</code> object, we can do that just like this: <code>myHouse.garden = true;</code>. It does not matter that this property is not defined within the original object.\r\n\r\n<h4 class=“center”>Using the Bracket Operator</h4>\r\n\r\n<p>We can also access object properties in a similar way we can access array indices, using brackets. Instead of numbers, we need to pass in a string in order to access the property, like this: <code>myHouse[“volume”];</code>. \r\n\r\n<h5 class=“center”>Adding Properties</h5>\r\n\r\n<p>A nice thing about using brackets is that we can create properties that include spaces, the brackets check for an exactly matched string. If that string is not found, it is created and added to the property. For example, let’s add the number of beds to our <code>myHouse</code> object.</p>\r\n\r\n<p><code>myHouse[“# of beds”] = 6;</code></p>\r\n\r\n<p>It is important to note that you cannot log the property like this: <code>console.log( myHouse.”# of beds” );</code>. This is invalid syntax and will return an ERROR. We can’t put a string after a dot! Instead we need to use brackets, like so: <code> console.log( myHouse[“# of beds”] );</code>. Key names with spaces can only be accessed using brackets.</p>\r\n\r\n<h5 class=“center”>Changing Contents to Individual Objects</h5>\r\n\r\n<p>We can create individual objects out of object properties. Let’s try to do this with our <code>rooms</code> property in our <code>myHouse</code> object.</p>\r\n\r\n<p>First we need to delete our rooms property: <code>delete myHouse.rooms;</code> (note that the return value is always “true”, even if you try to delete a non-existing property. Our program just checks if the property is gone). Now the entire <code>rooms</code> property is deleted, not just its value. Note that if we were to log out <code>roomsArray</code>, we’d still get the original array of rooms. The only things that is deleted is the reference to the array in the <code>myHouse</code> object.</p>\r\n\r\n<p>After deleting our <code>rooms</code> property, we can now build a function that creates room objects and adds them to our house.</p>\r\n\r\n<p>Before creating this function, we’ll create a new property that tracks the number of rooms. We set its initial value to zero. Our function can use this value to dynamically assign property names. Now our <code>myHouse</code> object looks like this:</p>\r\n\r\n<code><pre>var myHouse = {height: 8, width: 10, length: 12, volume: 960, material: “wood”, “# of rooms”: 0 };</pre></code>\r\n\r\n<code><pre>function addRoom (house, name) {\r\n    house[“# of rooms”]++;\r\n    house[“room” + house[“# of rooms”]] = {occupant: name};\r\n}</pre></code>\r\n\r\n<p>Every time we create a room object, the number of rooms in our house is increased. We also concatenate the current room number with “room” to get a new property name. We pass an object literal to our new property that assigns an occupant of the room.</p>\r\n\r\n<p>Let’s call our new function! <code>addRoom(myHouse, “Anja”);</code></p>\r\n\r\n<p>Now our <code>myHouse</code> object looks like this: </p>\r\n\r\n<code><pre>var myHouse = {height: 8, width: 10, length: 12, volume: 960, material: “wood”, “# of rooms”: 1, room1: { occupant: “Anja” };</pre></code>\r\n\r\n<p>Sweet! The correct room number in the property name is assigned correctly.</p>\r\n\r\n<h5 class=“center”>Referencing Objects Within Objects</h5>\r\n<p>You might wonder how you could access the <code>occupant</code> property within our <code>room1</code> property. It is nested one deep. Well, we can use the dot notation, like so: \r\n<code>console.log( myHouse.room.occupant );</code></p>  <p>We could also use the bracket notation in this way: <code>console.log( myHouse[“room1”][“occupant”] );</code></p>",
  topic: "Javascript",
  created_at: "2016-06-28"
)