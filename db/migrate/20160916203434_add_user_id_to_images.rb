class AddUserIdToImages < ActiveRecord::Migration[5.0]
  def change
    remove_column :images, :photographer_id
    add_column :images, :user_id, :integer
  end
end
