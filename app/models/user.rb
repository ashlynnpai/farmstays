class User < ActiveRecord::Base
  
  has_many :reviews
  has_secure_password validations: false
  has_many :farms

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 7}
  validates :name, presence: true
end