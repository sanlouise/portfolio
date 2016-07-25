user = User.first

user.blogs.create!(
  title: "Browsing Through Users",
  body: "<p>Chances are that you need to implement a search functionality that allows users to browse through other members of the platform. I did exactly this while building my project ‘The Athletes Crib’, and this post will explain how I did this. Please note that I use <a href=“http://materializecss.com/> Materialize</a> for styling. </p>\r\n\r\n<h4 class=“center”>What I Already Did</h4>\r\n<p>This post will not cover the entire process that starts with creating users and implementing basic views. I have already set up user authentication using Devise and created around 10 different users. I whitelisted the following params: first_name, last_name and email. My homepage is views/dashboard/index.html.erb. I also created a file in the same directory called search.html.erb. I also used the will_paginate gem to make long user lists more readable.</p>\r\n\r\n<h4 class=“center”>Search Functionality</h4>\r\n\r\n<p>First, add the following code to the head of your application:<pre><code><xmp><link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\"></xmp></code></pre></p>\r\n\r\n<h5>Views</h5>\r\n\r\n<p>Type this code wherever you want the search bar to appear. I put it in views/dashboard/index.html.erb\r\n<pre><code><xmp><%= form_tag(search_dashboard_path, role: \"search\") do %>\r\n  <div class=“input-field\">\r\n    <%= text_field_tag :search_name, nil, placeholder: \"Search members\" %>\r\n  </div>\r\n    <i class=\"small material-icons\"><%= submit_tag “search”%></i>\r\n<% end %></xmp></pre></code></p>\r\n\r\n<p>I put the following code in views/dashboard/search.html.erb:\r\n\r\n<pre><code><xmp><div>\r\n  <% @athletes.each do |athlete| %>\r\n    <div>\r\n      <%= athlete.full_name %>\r\n    </div>\r\n    <% end %>\r\n</div>\r\n<%= will_paginate @athletes %></xmp></pre></code></p>\r\n\r\n<h5>Routes</h5>\r\n<p>Now go yo your routes.rb file and make sure you add something like this:\r\n<pre><code>resource :dashboard, only: [:index] do\r\n  collection do\r\n    post :search, to: 'dashboard#search'\r\n  end\r\nend</pre></code></p>\r\n\r\n<p>Note that the search results are passed onto the dashboard/search.html.erb view. Again, I used the will_paginate gem for a better user experience browsing though users.</p>\r\n\r\n<h5>Controllers</h5>\r\n<p>In my dashboard_controller.rb I added the following code:\r\n<pre><code>def search\r\n  @athletes = User.search_by_name(params[:search_name]).paginate(:page => params[:page])\r\nend</pre></code></p>\r\n\r\n<h5>Models</h5>\r\n<p>In your user.rb model file, add the following code. Although it might look intimidating at first,  it really shouldn’t be!</p>\r\n\r\n<pre><code>def self.search_by_name(name)\r\n  names_array = name.split(' ')\r\n  #The 1 here stands for either a first_name, or a last_name. One of them was entered.\r\n  if names_array.size == 1\r\n    where('first_name LIKE ? or last_name LIKE ?',\r\n    #Ok. Here it might seem complicated but no worries! All this code does is linking the LIKE’s to the code below. The user has started typing in a first_name or last_name (so it is in the first position of the names_array). In this example, the results are listing in alphabetical order depending on the first_name.\r\n    \"%\#{names_array[0]}%\", \"%\#{names_array[0]}%\").order(:first_name)\r\n  else\r\n    where('first_name LIKE ? or first_name LIKE ? or last_name LIKE ? or last_name LIKE ?',\r\n    #Same thing happens here. The only difference is that the user has now entered both a first_name and last_name. So the LIKE’s need to be linked to both the first and second position in the names_array.\r\n    \"%\#{names_array[0]}%\", \"%\#{names_array[1]}%\", “%\#{names_array[0]}%”, “%\#{names_array[1]}%\").order(:first_name)\r\n  end\r\nend</pre></code></p>\r\n<p>That’s all it should take! Please message me if anything is unclear or should be edited. You can find my repo <a href=\"https://github.com/sanlouise/rspec-workouts\">here</a> for reference.</p>",
  topic: "Ruby on Rails",
  created_at: "2016-05-05"
)