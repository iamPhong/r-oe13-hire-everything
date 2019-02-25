require "rails_helper"

RSpec.describe User, type: :model do
  context "associations" do
    it {is_expected.to have_many(:comments)}
    it {is_expected.to have_many(:news_leases)}
    it {is_expected.to have_many(:news_need_rents)}
    it {is_expected.to have_many(:notifications)}
  end
end
