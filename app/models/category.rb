class Category < ApplicationRecord
  has_many :news_leases
  has_many :news_need_rents
end
