require 'spec_helper'

describe Purchase do
  let(:input) { File.new(Rails.root + "spec" + "data" + "example_input.tab") }
  
  it "creates a purchase for each line" do
    expect{Purchase.import_from_file(input)}.to change{Purchase.count}.from(0).to(4)
  end
end
