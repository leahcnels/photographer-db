class DropPhotographers < ActiveRecord::Migration[5.0]
  def change
    drop_table :photographers
    drop_table :categories_photographers
  end
end
