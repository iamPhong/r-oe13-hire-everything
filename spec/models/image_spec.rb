require "rails_helper"

RSpec.describe Image, type: :model do
  context "associations" do
    it { is_expected.to have_many :news_leases }
  end
end
