class AddTelNumToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :tel_num, :string
  end
end
