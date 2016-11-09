class Category < ApplicationRecord
  has_many :item
  scope :get_all_categories, -> {
    select("id,name")
      .order("name")
  }
end
