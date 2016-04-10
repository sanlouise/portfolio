class CreateOtherProjects < ActiveRecord::Migration
  def change
    create_table :other_projects do |t|
      t.string :title
      t.string :description
      t.string :points
      t.string :github
      t.string :live_link
      t.string :image

      t.timestamps null: false
    end
  end
end
