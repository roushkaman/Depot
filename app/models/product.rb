class Product < ActiveRecord::Base
	has_many :line_items

  	before_destroy :ensure_not_referenced_by_any_line_item

  	attr_accessible :title, :description, :image_url, :price

  	validates :title, :length => { maximum: 25, message: "Dlinna ne ta =). Nughno do 25" }, uniqueness: true
  	validates :title, :description, :image_url, presence: true
 	 validates :price, numericality: {greater_than_or_equal_to: 0.01} 
  	validates :image_url, allow_blank: true, format: {
  		with: %r{\.(gif|jpg|png)$}i,
  		message: 'format this: jpg, png and gif'
  	}

  	private

  	def ensure_not_referenced_by_any_line_item
  		if line_items.empty?
  			return true
  		else
  			errors.add(:base, 'any line items')
  			return false
  		end
 	end
end
