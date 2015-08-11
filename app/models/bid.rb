class Bid < ActiveRecord::Base
  extend Enumerize

  belongs_to :user, required: true

  enumerize :area_type, in: [:urban, :rural]
  enumerize :payment_type, in: [:cash, :forward]
  enumerize :product, in: [:corn, :soy, :wheat, :sorghum]
  enumerize :status, in: [:available, :progress, :purchased, :paid, :released, :delivered], default: :available

  validates :user, :product, :quantity, :price, :city, :state,
            :area_type, :payment_type, :number_of_days, presence: true
  validates :payment_term, presence: true, if: :forward?
  validates :unpaved_road, presence: true, if: :rural_area?

  validates :number_of_days, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :payment_term, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, if: :forward?
  validates :unpaved_road, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, if: :rural_area?

  scope :available, ->(user) { where.not(user: user) }
  scope :most_recent, -> { order(created_at: :desc) }

  def forward?
    payment_type.to_s.inquiry.forward?
  end

  def rural_area?
    area_type.to_s.inquiry.rural?
  end
end
