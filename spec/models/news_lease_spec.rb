require "rails_helper"

RSpec.describe NewsLease, type: :model do
  context "associations" do
    it {is_expected.to belong_to(:type)}
    it {is_expected.to belong_to(:user)}
    it {is_expected.to belong_to(:category)}
  end
end
