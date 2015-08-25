class Order < ActiveRecord::Base
  extend Enumerize

  enumerize :status, in: [:interest, :closed, :purchased], default: :interest

  belongs_to :bid, counter_cache: true, required: true
  belongs_to :user, required: true

  validates :status, presence: true
end
