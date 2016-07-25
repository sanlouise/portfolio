Blog.create!(
  title: "Adding a Map with Gmaps4rails",
  body: "<p>Many interactive websites use Google Maps to display points of interest. With Ruby on Rails this is not hard to do, however there are many ways to go about the process and small errors in your code can make for a frustrating development experience. I will walk you through a very simple implementation of Google Maps using the gmaps4rails gem to list various projects.</p>\r\n\r\n<h4 class=“center”>Let’s Get Set Up</h4>\r\n\r\n<h5 class=“center”>Gemfile</h5>\r\n<p>Add gem ‘geocoder' and gem ‘gmaps4rails' to your Gemfile. And run <code>bundle</code>.</p>\r\n\r\n<h5 class=“center”>Run Migrations</h5>\r\n\r\n<p>In this example, I’ll be creating a table for projects. I run the following command: <code> rails g scaffold Project latitude:float longitude:float organization:string address:string project_name:string.</code> Now run <code>rake db:migrate</code>.\r\n\r\n<h5 class=“center”>Define Route and View</h5>\r\n<p>Define your root route under config/routes.rb. If you are following along and want to make a project listing, use <code>root projects#index</code>. You have access to this view because of the migration we ran previously, resulting in <code>resources :projects</code> in your routes.rb file. </p>\r\n<p>Run your server and you’ll be able to see your projects table. We’ll need to go through one more step to enable our code to automatically find the coordinates of an entered address.</p>\r\n\r\n<h5 class=“center”>Convert Address to Coordinates</h5>\r\n<p>Go to models/user.rb and make sure it looks like this: <pre><code>class Project < ActiveRecord::Base\r\n  geocoded_by :address\r\n  after_validation :geocode\r\nend</code></pre>\r\n\r\nNow an address can be converted to coordinates. Try it yourself! Refresh your browser and create a new project. You don’t have to fill out the latitude and longitude fields, those fields will automatically be updated in the projects table when you enter a valid address.</p>\r\n\r\n<h4 class=“center”>Add A Map</h4>\r\n\r\n<p>Now that we’ve git our coordinates set up, it’s time to add our map.\r\n\r\n<h5 class=“center”>Views</h5>\r\n\r\n<p>Add the following Javascript to the top of your views/projects/index.html.erb. <pre><code><xmp><script src=\"//maps.google.com/maps/api/js?v=3.18&sensor=false&client=&key=&libraries=geometry&language=&hl=&region=\"></script> \r\n<script src=\"//google-maps-utility-library-v3.googlecode.com/svn/tags/markerclustererplus/2.0.14/src/markerclusterer_packed.js\"></script>\r\n<script src='//google-maps-utility-library-v3.googlecode.com/svn/tags/infobox/1.1.9/src/infobox_packed.js' type=‘text/javascript’></script></xmp></code></pre><p>.\r\n\r\n<h5 class=“center”>UnderscoreJS</h5>\r\n<p>You’ll also need to create a file under vendor/assets/javascripts and call it something like underscore.js. Go to <a href=“http://www.underscorejs.org/ >underscorejs.org</a>, go to downloads and click on the available production version. Copy all the content within the file and paste it into your newly created underscore.js file. <p>\r\n\r\n<p>In your application.js, add the following code: <pre><code>//= require underscore\r\n//= require gmaps/google</code></pre></p>\r\n\r\n<h4 class=“center”>Create Your Map</h4>\r\n<p>We want to add markers to all our project addresses. Right underneath your table, add the following code to your views/projects/index.html.erb file:<pre><code><xmp><div style='width: 800px';>\r\n  <div id=\"map\", style='width: 800px; height: 400px;'></div>\r\n</div>\r\n<script type=\"text/javascript\">\r\nhandler = Gmaps.build('Google');\r\nhandler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){\r\n  markers = handler.addMarkers(<%=raw @hash.to_json %>);\r\n  handler.bounds.extendWith(markers);\r\n  handler.fitMapToBounds();\r\n});\r\n</script></xmp></code></pre>\r\n\r\n<p>Now make sure the index method in your project controller looks something like this:<pre><code>  def index\r\n    @projects = Project.all\r\n    @hash = Gmaps4rails.build_markers(@projects) do |project, marker|\r\n      marker.lat project.latitude\r\n      marker.lng project.longitude\r\n      marker.infowindow project.project_name \r\n    end\r\n  end</code></pre></p>\r\n\r\n<h4 class=“center”>Done!</h4>\r\n\r\n<p>Create a few projects and you’ll see that the map will be filled with markers pointing to the addresses! When you click on a marker, there will be an info box with the name of the project. You can change the content of the info boxes in your projects controller.</p>\r\n\r\n<h4 class=“center”>Style Your Map (optional)</h4>\r\n\r\n<p>Via this website www.gmaps-samples-v3.googlecode.com/svn/trunk/styledmaps/wizard/index.html?utm_medium=twitter, you can select different styles for your map. After you’ve picked your styles, click on “Show Jason”, and copy that code into your projects/index.html.erb file in between the curly braces of ‘provider’. Also, before the JSON code and right after ‘provider’, add  ‘styles:’. The line of code will now look like this: <code>handler.buildMap({ provider: {styles: [</code>. </p>\r\n\r\n\r\n\r\n",
  topic: "Ruby on Rails",
  created_at: "2016-05-07"
)