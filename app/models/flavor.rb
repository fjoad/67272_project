class Flavor < ApplicationRecord
  has_many :store_flavors
  has_many :stores, through: :store_flavors

  validates_presence_of :name

  scope :active,          -> { where(active: true) }
  scope :inactive,        -> { where(active: false) }
  scope :alphabetical,    -> { order('name') }
  
  
  before_destroy do
    if self.active
        self.make_inactive
    end
    self.errors.add(:base, 'cannot delete a flavor')
    throw(:abort)
  end
  

  private
  
  def make_inactive
  	self.active = false
  	self.save
  end
  
end
class Flavor < ApplicationRecord
  has_many :store_flavors
  has_many :stores, through: :store_flavors

  validates_presence_of :name

  scope :active,          -> { where(active: true) }
  scope :inactive,        -> { where(active: false) }
  scope :alphabetical,    -> { order('name') }
  
  
  before_destroy do
    if self.active
        self.make_inactive
    end
    self.errors.add(:base, 'cannot delete a flavor')
    throw(:abort)
  end
  

  private
  
  def make_inactive
  	self.active = false
  	self.save
  end
  
end
