class Order < ActiveRecord::Base
  validates :address, :city, :state, presence: true

  belongs_to :listing
  belongs_to :buyer, class_name: "User"
  belongs_to :tutor, class_name: "User"
end