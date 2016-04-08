class DropEmptyTable < ActiveRecord::Migration
  def change
    drop_table :[]
  end
end
