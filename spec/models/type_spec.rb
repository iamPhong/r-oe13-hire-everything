require "rails_helper"

RSpec.describe Type, type: :model do
  context "associations" do
    it {is_expected.to belong_to(:category)}
    it {is_expected.to have_many(:news_need_rents)}
    it {is_expected.to have_many(:news_leases)}
  end
end
