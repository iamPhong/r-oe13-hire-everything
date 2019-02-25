require "rails_helper"

RSpec.describe Notification, type: :model do
  context "associations" do
    it {is_expected.to belong_to(:user)}
  end
end
