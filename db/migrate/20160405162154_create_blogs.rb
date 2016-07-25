class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :body
      t.string :topic
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
