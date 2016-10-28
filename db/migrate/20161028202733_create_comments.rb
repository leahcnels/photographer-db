class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.column :title, :string
      t.column :body, :string
      t.column :user_id, :integer
      t.column :posting_id, :integer

      t.timestamps
    end
  end
end
