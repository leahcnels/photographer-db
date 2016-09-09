class Photographer < ActiveRecord::Base
  has_many :images, dependent: :destroy
  has_and_belongs_to_many :categories

  validates :name, :presence => true
  validates :address, :presence => true
  validates :phone, :presence => true
  validates :email, :presence => true
end
