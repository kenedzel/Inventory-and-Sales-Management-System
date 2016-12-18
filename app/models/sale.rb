class Sale < ApplicationRecord
  belongs_to :item
  
  require 'csv'

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |item|
        csv << sale.attributes.values_at(*column_names)
      end
    end
  end
end
