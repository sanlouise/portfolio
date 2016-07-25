module BlogsHelper

	def create_blog_file(blog)
		title = blog.title.downcase.gsub(/[ .]/, '_')

		blog_file = File.new("db/blog_posts/#{title}.rb", 'w+')

		blog_file.puts "Blog.create!(\n\ttitle: '#{blog.title}',\n\tbody: '#{blog.body}',\n\ttopic: '#{blog.topic}',\n\tcreated_at: '#{blog.created_at}'\n)"

		blog_file.close
	end

end