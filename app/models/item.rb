class Item < ApplicationRecord
  belongs_to :category
  belongs_to :status

  validates :stock, :numericality => { :greater_than_or_equal_to => 0}

  scope :get_all_items, -> {
    select("id,name")
      .order("name")
  }

  scope :get_item, ->(id) {
    select("id, name, code, category_id, retail_price, cost_price, stock, status_id")
    .from("items where id =" + id )
  }
end
