class User < ApplicationRecord
  has_many :comments
  has_many :news_leases
  has_many :news_need_rents
  has_many :notifications
end
