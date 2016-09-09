class Image < ActiveRecord::Base
  belongs_to :photographer

  validates :img_file_file_name, :presence => true
end
