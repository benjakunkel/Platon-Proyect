class Shop < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :user
  has_many :carts
  has_many :users, through: :carts
  validates :name, uniqueness: true, presence: true
  validates :address, uniqueness: true, presence: true
  validates :phone_number, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  has_one_attached :photo
end
