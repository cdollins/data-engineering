class AddItemFkToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :item_id, :interger
  end
end
