class AddMerchantFkToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :merchant_id, :interger
  end
end
