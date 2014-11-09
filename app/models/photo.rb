class Photo < ActiveRecord::Base

  has_attached_file :image, :style => {:standard => "300x300"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
