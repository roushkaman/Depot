atom_feed do |feed|
	feed.title "Поступление заказов"

	@orders.each do |order|
		feed.entry(order) do |entry|
			entry.title "Заказ № #{order.id}"
			entry.summary type: 'xhtml' do |xhtml|
				xhtml.p "Заказчик: #{order.name}"
				xhtml.p "Адрес: #{order.address}"
				xhtml.p "Номер телефона: #{order.tel_num}"

				xhtml.table do
					xhtml.tr do
						xhtml.th 'Товар:'
						xhtml.th 'Количество:'
						xhtml.th 'суммарная цена:'
					end
					order.line_items.each do |item|
						xhtml.tr do
							xhtml.td item.product.title
							xhtml.td item.quantity
							xhtml.td number_to_currency item.total_price
						end
					end

					xhtml.tr do
						xhtml.th 'И того:', colspan: 2
						xhtml.th number_to_currency \
							order.line_items.map(&:total_price).sum
					end
				end

					xhtml.p "Способ оплаты: #{order.payment_type.pay_type}"
				
			end
			entry.author do |author|
				entry.name order.name
				entry.email order.email
			end
		end
	end
end