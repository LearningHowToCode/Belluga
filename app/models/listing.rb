class Listing < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "50x50>" }, :default_url => "default.jpg"
end