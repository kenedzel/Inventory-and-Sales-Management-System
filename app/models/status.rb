class Status < ApplicationRecord
  scope :get_all_statuses, -> {
    select("id,name")
      .order("name")
  }
end
