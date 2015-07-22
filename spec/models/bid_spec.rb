require "rails_helper"

RSpec.describe Bid do
  describe "relationships" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:area_type) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:number_of_days) }
    it { is_expected.to validate_presence_of(:payment_type) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:product) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:user) }

    context "when payment_type is cash" do
      subject { described_class.new(payment_type: :cash) }

      it { is_expected.to_not validate_presence_of(:payment_term) }
      it { is_expected.to_not validate_numericality_of(:payment_term) }
    end

    context "when payment_type is forward" do
      subject { described_class.new(payment_type: :forward) }

      it { is_expected.to validate_presence_of(:payment_term) }
      it { is_expected.to validate_numericality_of(:payment_term).only_integer.is_greater_than_or_equal_to(1) }
    end

    it { is_expected.to validate_numericality_of(:number_of_days).only_integer.is_greater_than_or_equal_to(1) }
  end
end
