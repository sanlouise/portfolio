class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :body
      t.string :image
      t.string :topic

      t.timestamps null: false
    end
  end
end
