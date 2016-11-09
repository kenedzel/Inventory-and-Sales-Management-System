class Item < ApplicationRecord
  belongs_to :category
  belongs_to :status
  belongs_to :unit

  validates :stock, :numericality => { :greater_than_or_equal_to => 0}

  scope :get_all_items, -> {
    select("id,name")
      .order("name")
  }
end
