class Rating < ActiveRecord::Base
  belongs_to :user

  validates :stars, :presence => true
  validates :feedback, :presence => true
end
