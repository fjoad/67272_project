class Flavor < ApplicationRecord
   before_destroy :cannot_delete    
    
  has_many :store_flavors
  has_many :stores, through: :store_flavors

  validates_presence_of :name

  scope :active,          -> { where(active: true) }
  scope :inactive,        -> { where(active: false) }
  scope :alphabetical,    -> { order('name') }

  private
  
  def make_inactive
  	self.active = 0
  	self.save
  end
  
  def cannot_delete
    self.make_inactive
    return false
  end
end
