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

  scope :with_category, ->(category) { joins(:products).merge(Product.where(category: category)).distinct }


  def distance_from(user)
    if latitude.blank? || longitude.blank?
      return "Direccion no disponible"
    else
      distance = self.distance_to([user.latitude, user.longitude])
      distance_value = (distance < 1) ? (distance * 1000).to_i  : distance.to_i
      if distance < 1 
        distance_unit = distance_value == 1 ? "metro": "metros"
      else
       distance_unit =  distance_value == 1 ? "kilometro": "kilometros"
      end
      return "#{distance_value} #{distance_unit}"
    end
  end
end
