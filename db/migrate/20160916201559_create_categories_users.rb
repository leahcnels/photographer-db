class CreateCategoriesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_users, id: false do |t|
        t.belongs_to :category, index: true
        t.belongs_to :user, index: true
    end
  end
end
