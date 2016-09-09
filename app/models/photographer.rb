class Photographer < ActiveRecord::Base
  has_many :images
  has_and_belongs_to_many :categories

  validates :name, :presence => true
  validates :address, :presence => true
end
