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
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
