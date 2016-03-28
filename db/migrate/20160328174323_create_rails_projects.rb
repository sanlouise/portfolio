class CreateRailsProjects < ActiveRecord::Migration
  def change
    create_table :rails_projects do |t|
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
