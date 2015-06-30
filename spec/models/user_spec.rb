require "rails_helper"

RSpec.describe User do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:personable_type) }
    it { should validate_presence_of(:phone) }

    it { should validate_confirmation_of(:password) }

    context "when is a company" do
      subject { described_class.new(personable_type: :company) }

      it { should validate_presence_of(:corporate_name) }
    end

    context "when is an individual" do
      subject { described_class.new(personable_type: :individual) }

      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
    end
  end
end
