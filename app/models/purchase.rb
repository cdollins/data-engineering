require 'csv'
class Purchase < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :item
  belongs_to :customer
  
  def self.import_from_file(file)
    
    tsv = CSV(file, { :col_sep => "\t" })
    headers = tsv.readline
    tsv.each do |row|
      options = Hash[headers.zip(row)]
      merchant = Merchant.where(name: options["merchant name"]).first_or_create(address: options["merchant address"])
      item = Item.where(description: options["item description"]).first_or_create(price: options["item price"])
      customer = Customer.where(name: options["purchaser name"]).first_or_create
      Purchase.create(count: options["purchase count"], merchant: merchant, item: item, customer: customer)
    end
  end
end
