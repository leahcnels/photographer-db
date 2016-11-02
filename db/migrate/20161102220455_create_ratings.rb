class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.column :stars, :integer
      t.column :feedback, :string
      t.column :user_id, :integer
      t.column :author_id, :integer

      t.timestamps
    end
  end
end
