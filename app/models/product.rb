class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  validates :title, :length => { maximum: 25, message: "Dlinna ne ta =). Nughno do 25" }, uniqueness: true
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01} 
  validates :image_url, allow_blank: true, format: {
  	with: %r{\.(gif|jpg|png)$}i,
  	message: 'format this: jpg, png and gif'
  }
end
