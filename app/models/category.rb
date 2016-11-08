class Category < ApplicationRecord
  scope :get_all_categories, -> {
    select("id,name")
      .order("name")
  }
end
