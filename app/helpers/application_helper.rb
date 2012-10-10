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

	def hidden_div_if(condition, attributes = {}, &block)
		if condition
			attributes["style"] = "display: none"
		end
		content_tag("div", attributes, &block)
	end

end
