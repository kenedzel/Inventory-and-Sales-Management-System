class Status < ApplicationRecord
  has_many :item
  scope :get_all_statuses, -> {
    select("id,name")
      .order("name")
  }
end
