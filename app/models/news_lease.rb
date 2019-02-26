class NewsLease < ApplicationRecord
  belongs_to :type
  belongs_to :user
  belongs_to :category
end
