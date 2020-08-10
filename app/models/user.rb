class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :owner, :admin]
  has_many :carts
  has_one :shop
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  def active_cart
    carts.find_by(submited_at: nil) #scopes carts - user
  end
  
  def submited_cart
    carts.find_by(submited_at: !nil)
  end

end
