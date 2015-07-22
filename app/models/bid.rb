class Bid < ActiveRecord::Base
  extend Enumerize

  belongs_to :user, required: true

  enumerize :area_type, in: [:urban, :rural]
  enumerize :payment_type, in: [:cash, :forward]
  enumerize :product, in: [:corn, :soy, :wheat, :sorghum]

  validates :user, :product, :quantity, :price, :city, :state,
            :area_type, :payment_type, :number_of_days, presence: true
  validates :payment_term, presence: true, if: :forward?

  validates :number_of_days, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :payment_term, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, if: :forward?

  scope :available, ->(user) { where.not(user: user) }
  scope :most_recent, -> { order(created_at: :desc) }

  def forward?
    payment_type.to_s.inquiry.forward?
  end
end
