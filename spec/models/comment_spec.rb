require "rails_helper"

RSpec.describe Comment, type: :model do
  context "associations" do
    it {is_expected.to belong_to(:user)}
    it {is_expected.to belong_to(:news_need_rent)}
    it {is_expected.to belong_to(:news_lease)}
  end
end
