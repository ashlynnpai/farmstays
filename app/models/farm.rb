class Farm < ActiveRecord::Base
  has_many :reviews
  belongs_to :region
  
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
     
  def self.latest_farms
    Farm.order('created_at DESC').first(3)
  end

end

