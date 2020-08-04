class Shop < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :user
  validates :name, uniqueness: true, presence: true
  validates :address, uniqueness: true, presence: true
  validates :phone_number, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
end
