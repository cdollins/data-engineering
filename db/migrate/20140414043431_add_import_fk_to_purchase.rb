class AddImportFkToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :import_id, :interger
  end
end
