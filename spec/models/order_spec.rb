require "rails_helper"

RSpec.describe Order, type: :model do
  describe "relationships" do
    it { is_expected.to belong_to(:bid) }
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:bid) }
    it { is_expected.to validate_presence_of(:status) }
  end
end
