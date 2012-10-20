class PaymentType < ActiveRecord::Base
	attr_accessible :pay_type
	
  has_many :orders
end
