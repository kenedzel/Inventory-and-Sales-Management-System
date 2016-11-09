class Unit < ApplicationRecord
  has_many :item
  scope :get_all_units, -> {
    select("id,name")
      .order("name")
  }
end
