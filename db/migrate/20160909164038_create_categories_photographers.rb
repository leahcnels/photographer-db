class CreateCategoriesPhotographers < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_photographers, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :photographer, index: true
    end
  end
end
