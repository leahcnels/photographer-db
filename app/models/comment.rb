class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :posting

  validates :body, :presence => true
end
