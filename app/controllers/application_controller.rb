# coding: utf-8
class ApplicationController < ActionController::Base

  before_filter :authorize
  protect_from_forgery

  	@admin_find = User.first

  private

  	def current_cart
  		Cart.find(session[:cart_id])
  	rescue ActiveRecord::RecordNotFound
  		cart = Cart.create
  		session[:cart_id] = cart.id
  		cart
  	end

  protected
  	def authorize
  		unless User.find_by_id(session[:user_id])
  			redirect_to login_url, notice: 'Пожалуйсто, пройдите авторизацию'
  		end
  	end
end