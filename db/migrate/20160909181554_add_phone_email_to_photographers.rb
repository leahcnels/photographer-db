class AddPhoneEmailToPhotographers < ActiveRecord::Migration[5.0]
  def change
    add_column :photographers, :phone, :string
    add_column :photographers, :email, :string
  end
end
