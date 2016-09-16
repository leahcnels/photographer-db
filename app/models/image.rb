class Image < ActiveRecord::Base
  belongs_to :user
  has_attached_file :img_file, styles: { default: "600x600>", thumb: "200x200>" }, default_url: "/images/:style/missing.png"
  validates_attachment :img_file, content_type: { content_type: /\Aimage\/.*\z/ }
  validates :img_file_file_name, :presence => true
end
