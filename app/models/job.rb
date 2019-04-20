class Job < ApplicationRecord
    before_destroy :can_delete
    
    has_many :shift_jobs
    has_many :shifts, through: :shift_jobs
    
    validates_presence_of :name
    
    scope :active,          -> { where(active: true) }
    scope :inactive,        -> { where(active: false) }
    scope :alphabetical,    -> { order('name') }
    
    private 
    
    def jobs?
        self.shift_jobs.nil?
    end
    
    def inactive
        self.update_attribute(:active, false)
    end
    
    def can_delete
        if jobs?
            self.inactive
            return false 
        else
            return true
        end
    end
end
