require "rails_helper"

RSpec.describe Bid do
  describe "relationships" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:number_of_days) }
    it { is_expected.to validate_presence_of(:payment_type) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:product) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:user) }

    it { is_expected.to validate_numericality_of(:number_of_days).only_integer.is_greater_than_or_equal_to(1) }
  end
end