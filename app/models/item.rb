class Item < ApplicationRecord

  scope :get_all_items, -> {
    select("id,name")
      .order("name")
  }
end
