class User < ActiveRecord::Base
  extend Enumerize

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  store_accessor :profile, :first_name, :last_name, :corporate_name,
                           :cpf, :cnpj, :personable_type, :phone

  has_many :bids, dependent: :destroy
  has_many :orders, dependent: :destroy

  enumerize :personable_type, in: [:company, :individual], default: :individual

  validates :personable_type, :phone, presence: true
  validates :first_name, :last_name, presence: true, if: :individual?
  validates :corporate_name, presence: true, if: :company?
  validates :cpf, cpf: true, if: :individual?
  validates :cnpj, cnpj: true, if: :company?

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def company?
    personable_type.to_s.inquiry.company?
  end

  def individual?
    personable_type.to_s.inquiry.individual?
  end
end
