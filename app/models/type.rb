class Type < ApplicationRecord
  belongs_to :category
  has_many :news_need_rents
  has_many :news_leases
end
