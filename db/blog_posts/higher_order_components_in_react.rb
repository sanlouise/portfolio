Blog.create!(
	title: "Higher Order Components in React",
	body: "<p>A Higher Order Component (HOC) in React is a component that adds some additional functionality or data to a normal React Component. When we combine the both, we get an ‘Enhanced’ or ‘Composed’ Component. HOCs are perfect for extracting some common functionalities that can be shared amongst Components. HOCs are a great place to centralize logic to remove logic duplication.</p>\r\n\r\n<h4 class=“center”>HOC with Redux</h4>\r\n<p>HOCs are also often used with third party libraries, including Redux. If you’ve used Redux, you’ve used HOCs! Look at this code where we enhance our App Component through the <code>connect</code> HOC and with the <code>mapStateToProps</code> helper:\r\n\r\n<code><pre>\r\nfunction mapStateToProps(state) {\r\n\treturn { posts: state.posts };\r\n}\r\nexport default connect(mapStateToProps)(App);</pre></code>\r\n\r\n<p>We need to take a deeper look at the <code>connect</code> helper, which is made available though Provider.</p>\r\n\r\n<p>The code below requires the following import:</p>\r\n<code><pre>import { Provider } from ‘react-redux’;</pre></code>\r\n\r\n<p>Or, if you don’t write your app in ES2015 yet:</p>\r\n<code><pre>var Provider = require(‘react-redux’).Provider;</pre></code>\r\n\r\n<code><pre><xmp>ReactDOM.render(\r\n  <Provider store={createStoreWithMiddleware(reducers)}>\r\n    <App />\r\n  </Provider>\r\n  , document.querySelector('.container'));</xmp></pre></code>\r\n\r\n<p>The Provider holds Redux store inside of itself. Also, all Components are held by an instance of Connect.</p>\r\n\r\n<p>The Provider watches any updates in Redux Store, a change of state. Whenever it notices a change, it automatically updates any of its child Components. In other words, Provider broadcasts to any connected Component that they need to re-render with the new state. Because Connect tells our Components to re-render with new data, we call it a HOC. Its dependent Components are enhanced.</p>\r\n\r\n<code><pre>export default connect(mapStateToProps)(App);</pre></code>\r\n\r\n<p>Above we see that our enhanced and connected App Component is exported into Provider.</p>\r\n\r\n<p><i>This post was inspired by the Advanced React and Redux Course by Stephen Grider.</i></p>\r\n",
	topic: "JavaScript",
	created_at: "2016-07-18"
)