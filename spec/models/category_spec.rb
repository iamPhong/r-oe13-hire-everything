require "rails_helper"

RSpec.describe Category, type: :model do
  context "associations" do
    it {is_expected.to have_many(:types)}
  end
end
