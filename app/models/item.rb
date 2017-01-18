class Item < ApplicationRecord
  belongs_to :category
  belongs_to :status
  has_many :sale
  has_many :delivery

  validates :stock, :numericality => { :greater_than_or_equal_to => 0}

  require 'csv'

  scope :get_all_items, -> {
    select("id,name,stock")
      .order("name")
  }

  scope :get_item, ->(id) {
    select("id, name, category_id, cost_price, stock, status_id")
    .from("items where id =" + id )
  }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end

end
