require 'spec_helper'

describe Purchase do
  let(:input) { File.new(Rails.root + "spec" + "data" + "example_input.tab") }
  
  it "creates a purchase for each line" do
    expect{Purchase.import_from_file(input)}.to change{Purchase.count}.from(0).to(4)
  end
  
  it "creates a merchant for each merchant in file" do
    expect{Purchase.import_from_file(input)}.to change{Merchant.count}.from(0).to(3)
  end
  
  it "creates an item for each in file" do
    expect{Purchase.import_from_file(input)}.to change{Item.count}.from(0).to(3)
  end
  
  it "creates a customer for each in file" do
    expect{Purchase.import_from_file(input)}.to change{Customer.count}.from(0).to(3)
  end
end
