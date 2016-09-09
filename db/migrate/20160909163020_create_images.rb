class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.attachment :img_file
      t.column :photographer_id, :integer
    end
  end
end
