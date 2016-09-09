class CreatePhotographers < ActiveRecord::Migration[5.0]
  def change
    create_table :photographers do |t|
      t.column :name, :string
      t.column :address, :string

      t.timestamps
    end
  end
end
