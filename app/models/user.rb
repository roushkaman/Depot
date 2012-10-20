# coding: utf-8
class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation

  after_destroy :ensure_an_admin_remains

  validates :name, presence: true, uniqueness: true
  
  has_secure_password

  private

  def ensure_an_admin_remains
  	if User.count.zero?
  		raise "Последний пользователь не может быть удален!"  	  		
  	end  	
  end
end
