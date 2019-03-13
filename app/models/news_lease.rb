class NewsLease < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :place, optional: true
  belongs_to :image, optional: true
  accepts_nested_attributes_for :place, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :image, allow_destroy: true, update_only: true
end
