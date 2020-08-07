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
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def distance_from(user)
    if latitude.blank? || longitude.blank?
      return ""
    else
      distance = self.distance_to([user.latitude, user.longitude])
      return (distance < 1) ? "#{(distance * 1000).to_i} metros" : "#{distance.to_i} kilometros"
    end
  end
end
