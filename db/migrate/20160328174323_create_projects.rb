class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :points
      t.string :github
      t.string :live_link
      t.string :image
      t.string :project_type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
