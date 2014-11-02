class Listing < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "100x100>", :thumb => "50x50>" }, :default_url => "default.jpg"
end