module ApplicationHelper
	def time
		Time.now
	end

	def sess
		session		
	end

	def current_cart
		session[:cart_id]		
	end

end
