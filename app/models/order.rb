# coding: utf-8
class Order < ActiveRecord::Base
  attr_accessible :email, :name, :payment_type_id, :tel_num, :address, :ship_date


  validates :name, :address, :email, :tel_num, :payment_type_id, presence: true

  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  belongs_to :payment_type

  def add_line_items_from_cart(cart)
  	cart.line_items.each do |item|
  		item.cart_id = nil
  		line_items << item
  	end
  end
end
