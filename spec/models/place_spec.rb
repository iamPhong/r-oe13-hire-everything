require "rails_helper"

RSpec.describe Place, type: :model do
  it { is_expected.to have_many :news_leases }
end
