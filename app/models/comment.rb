class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :news_need_rent
  belongs_to :news_lease
end
