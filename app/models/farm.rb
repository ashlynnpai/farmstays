class Farm < ActiveRecord::Base
  has_many :reviews
  belongs_to :region
  
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
     
  def self.latest_farms
    Farm.order('created_at DESC').first(3)
  end
  
  def self.search_farms(term)
    return [] if term.blank?
    where("name ILIKE ? or address ILIKE ? or description ILIKE ?", "%#{term}%", "%#{term}%", "%#{term}%")
  end

end 

