class Bid < ActiveRecord::Base
  extend Enumerize

  belongs_to :user, required: true

  enumerize :payment_type, in: [:cash, :installments], default: :cash

  validates :user, :product, :quantity, :price, :city, :state,
            :payment_type, :number_of_days, presence: true

  validates :number_of_days, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
