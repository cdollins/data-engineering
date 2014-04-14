require 'carrierwave/orm/activerecord'
class Import < ActiveRecord::Base
  has_many :purchases
  mount_uploader :data, DataUploader
  
  after_create :process_data
  
  def process_data
    raise NoFileException if data.nil?
    self.total = Purchase.import_from_file(File.new(data.path), self)
    save
  end
  
  class NoFileException < Exception
  end
end