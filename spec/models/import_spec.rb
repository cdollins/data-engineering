require 'spec_helper'

describe Import do
  
  let(:input) { File.new(Rails.root + "spec" + "data" + "example_input.tab") }
  let(:import) { Import.create(data: input) }
  let(:nada) { Import.create }
  
  it "raise NoFileException when no file is attached" do
    expect{nada.process_data}.to raise_error
  end
  
  it "process data creating all purchases in the file" do
    expect{import.process_data}.to change{Purchase.count}.from(0).to(4)
  end
  
  it "calculates a grand total" do
    expect{import.process_data}.to change{import.total}.from(0).to(95.0)
  end
end