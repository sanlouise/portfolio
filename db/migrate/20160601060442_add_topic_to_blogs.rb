class AddTopicToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :topic, :string
  end
end
