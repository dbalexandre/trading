class Bid < ActiveRecord::Base
  extend Enumerize

  belongs_to :user, required: true

  enumerize :payment_type, in: [:cash, :forward]

  validates :user, :product, :quantity, :price, :city, :state,
            :payment_type, :number_of_days, presence: true

  validates :number_of_days, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  scope :available, ->(user) { where.not(user: user) }
  scope :most_recent, -> { order(created_at: :desc) }
end
