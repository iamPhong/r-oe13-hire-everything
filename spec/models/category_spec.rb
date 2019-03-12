require "rails_helper"

RSpec.describe Category, type: :model do
  context "associations" do
    it {is_expected.to have_many(:news_leases)}
    it {is_expected.to have_many(:news_need_rents)}
  end
end
