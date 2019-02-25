class Category < ApplicationRecord
  has_many :news_leases
  has_many :news_need_rents

  def fill(filter)
    if filter == "newest"
      self.news_leases.approved(true).order_desc
    elsif filter == "cheaper"
      self.news_leases.approved(true).order(price_value: :asc)
    else
      self.news_leases.approved(true).order_desc.where.not(sell: nil)
    end
  end
end
