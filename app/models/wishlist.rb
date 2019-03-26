class Wishlist < ApplicationRecord
  belongs_to :user
  belongs_to :news_lease
end
