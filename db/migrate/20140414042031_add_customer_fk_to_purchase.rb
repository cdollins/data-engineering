class AddCustomerFkToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :customer_id, :interger
  end
end
