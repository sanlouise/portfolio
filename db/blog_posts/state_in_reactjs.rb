user = User.first

user.blogs.create!(
  title: "State in React.js",
  body: "<h4 class=“center”>Setting State</h4>\r\n\r\n<p>State is a plain Javascript object used to record and react to user events. It exists on all class-based components, not functional-based components. All instances have their own copy of state. We initialize state by first defining the constructor method.</p>\r\n<p>Let's take a look at this piece of code and then break it down.</p>\r\n\r\n<code><pre><xmp>import React, { Component } from 'react';\r\n\r\nclass SearchBar extends Component {\r\n    constructor(props) {\r\n        super(props);\r\n\r\n        this.state = { term: ' ' };\r\n    }\r\n\t\r\n    render() {\r\n        return <input onChange={event => console.log(event.target.value)} />;\r\n    }\r\n}\r\n\r\nexport default SearchBar;</xmp></pre></code>\r\n\r\n<p>All Javascript classes have a special function <code>constructor</code>. The constructor function is the first, and only that is called automatically whenever a new instance of its parent class is created. The constructor function does some setting up inside of our class, such as the initialization of variables and state. The <code>constructor</code> function gets called all the time - whenever a new instance of the SearchBar class is created.</p>\r\n\r\n<p>Now, the reason we call <code>super</code> is the following. Our SearchBar Component has its own constructor function. When we define a method that already has been defined on the parent class (here Component), we can call that method on the parent class by calling <code>super</code>. If we don’t call <code>super</code>, we’ll run into an error.</p>\r\n\r\n<p>Whenever we use <code>state</code>, we initialize it by creating a new object and assigning it to <code>this.state</code>. The object we pass it, will have properties we want to record on the state. In our example, <code>term</code> stands for a search term. Note that we could use whatever name we want. So, whenever the user changes the search input, the <code>term</code> property will record that particular change. The value of input will thus be assigned to the (now) empty string.</p>\r\n\r\n<h4 class=“center”>Updating State</h4>\r\n\r\n<p>It is very important to note that we only manually assign properties to state (<code>this.state = { term: ‘’ };</code>) in the constructor function, nowhere else in our program. In all other places and components we use <code>this.setState</code>. Do not get confused with referencing to the value of state, <code>{this.state.term}</code> which can be called without any problem. </p>\r\n\r\n<p>Let’s update our render method accordingly.</p>\r\n\r\n<code><pre><xmp>render() {\r\n    return <input onChange={event => this.setState({ term: event.target.value})} />;\r\n}</xmp></pre></code>\r\n\r\n<p>In order to see this in action in the DOM, update your render method like this:</p>\r\n\r\n<code><pre><xmp>render() {\r\n    return (\r\n        <div>\r\n            <input onChange={event => this.setState({ term: event.target.value})} />\r\n            Value of the input: {this.state.term}\r\n        </div>\r\n    );\r\n }</xmp></pre></code>\r\n\r\n<p>Whatever you type into your input field, this text is now printed in real-time next to the text “Value of the input”. Awesome! This is possible because <code>this.setState</code> forces our DOM to re-render whenever an input change is detected.</p>\r\n\r\n<h4 class=“center”>Controlled Components</h4>\r\n\r\n<p>Now that we’ve linked SearchBar and Component state, the entire class component re-renders when the state changes. Let’s continue by updating the input field to become a controlled input field. This is a form element whose value is set by the state - instead of the other way around. Currently, whenever our input changes, it causes the state to be updated. Our input dictates what state should be. Ideally, this should be the other way around.</p>\r\n\r\n<p>Update your render method to match this code:</p>\r\n\r\n<code><pre><xmp>render() {\r\n    return (\r\n        <div>\r\n            <input \r\n            value ={this.state.term}\r\n            onChange={event => this.setState({ term: event.target.value})} />\r\n        </div>\r\n    );\r\n }</xmp></pre></code>\r\n\r\n<p>When we tell input that its value is provided by the state, we’ve turned it into a controlled component. Now, its value will only be updated when the state changes. This is the opposite of what happened previously. Whenever the component re-renders, the value is now set equal to  <code>this.state.term</code>.\r\n\r\n<p>So whenever the onChange handler is run, the value of term has not actually changed. When this event handler runs, it updates <code>this.state.term</code>, however is only actually updated when set equal to <code>value</code>. Note that when users type something, they did not actually change the input value, they only triggered an event. Because we updated the state with that event, that causes the value of input to update. Remember, the value of controlled components only changes when their state changes.</p>\r\n\r\n<p>This post was inspired by the Modern React with Redux class taught by Stephen Grider.</p>\r\n\r\n",
  topic: "JavaScript",
  created_at: "2016-06-10"
)