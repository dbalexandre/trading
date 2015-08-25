class Order < ActiveRecord::Base
  extend Enumerize

  enumerize :status, in: [:interest, :closed, :purchased], default: :interest

  belongs_to :bid, counter_cache: true, required: true
  belongs_to :user, required: true

  delegate :created_at, :number_of_days, :quantity, :orders_count,  :price, :product_text, to: :bid, prefix: true

  validates :status, presence: true

  scope :most_recent, -> { order(created_at: :desc) }
end
