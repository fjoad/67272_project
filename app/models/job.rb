class Job < ApplicationRecord
    
    has_many :shift_jobs
    has_many :shifts, through: :shift_jobs
    
    validates_presence_of :name
    
    scope :active,          -> { where(active: true) }
    scope :inactive,        -> { where(active: false) }
    scope :alphabetical,    -> { order('name') }
    
    
  before_destroy do
    if has_been_worked_on?
        self.make_inactive
        self.errors.add(:base, 'cannot delete a job if worked on by an employee')
        throw(:abort)
    end
  end
    
    
    def has_been_worked_on?
        self.shift_jobs.size > 0
    end
    
    def make_inactive
        self.update_attribute(:active, false)
    end
    
end
class Job < ApplicationRecord
    
    has_many :shift_jobs
    has_many :shifts, through: :shift_jobs
    
    validates_presence_of :name
    
    scope :active,          -> { where(active: true) }
    scope :inactive,        -> { where(active: false) }
    scope :alphabetical,    -> { order('name') }
    
    
  before_destroy do
    if has_been_worked_on?
        self.make_inactive
        self.errors.add(:base, 'cannot delete a job if worked on by an employee')
        throw(:abort)
    end
  end
    
    
    def has_been_worked_on?
        self.shift_jobs.size > 0
    end
    
    def make_inactive
        self.update_attribute(:active, false)
    end
    
end
