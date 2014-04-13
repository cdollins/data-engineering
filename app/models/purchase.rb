require 'csv'
class Purchase < ActiveRecord::Base
  def self.import_from_file(file)
    
    tsv = CSV(file, { :col_sep => "\t" })
    headers = tsv.readline
    tsv.each do |row|
      options = Hash[headers.zip(row)]
      Purchase.create(count: options["purchase count"])
    end
  end
end
