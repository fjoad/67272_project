class Shift < ApplicationRecord
  before_create :current_assignment_only 
  before_destroy :deleted
  after_create :end_time 
    
  belongs_to :Assignment
  has_one :employee, through: :assignment
  has_one :store, through: :assignment
  has_many :shift_jobs
  has_many :jobs, through: :shift_jobs
  
  validates_presence_of :date, :start_time, :assignment_id
  validates_time :end_time, :after => :start_time, allow_blank: true
  validates_date :date, :on_or_after => Date.current
  
  
  scope :completed,     -> { joins(:shift_jobs) }
  scope :incompleted,   -> { joins("LEFT JOIN shift_jobs ON shift_id")}
  scope :for_store,     -> (store_id) { joins(:assignment).where("store_id = ?", store_id) }
  scope :for_employee,  -> (employee_id) { joins(:assignment).where("employee_id = ?", employee_id) }
  scope :past,          -> { where("date < ?", Date.current) }
  scope :upcoming,      -> { where("date >= ?", Date.current) }
  scope :for_next_days, -> (next_days) { where("date between ? and ?", Date.current, Date.current + next_days) }
  scope :for_past_days, -> (past_days) { where("date between ? and ?", Date.current - past_days, Date.current - 1) }
  scope :by_store,      -> { joins(:store).order("stores.name") }
  scope :by_employee,   -> { joins(:employee).order("employees.last_name, employees.first_name") }
  scope :chronological, -> { order('date ASC') }
  
  
  
  def completed?
      !self.shift_jobs.nil?
  end
  
  
  def start_now
  	self.update_attribute(:start_time, Time.now)
  end
  
  def end_now
    self.update_attribute(:end_time, Time.now)
  end
  
  private 
  
  def current_assignment_only
    assignments = Assignment.current.map{|assignment| assignment.id}
    if assignments.include?(self.assignment_id)
        return true
    else 
        return false 
    end
  end
  
  def deleted
    if self.date >= Date.current 
        return true
    else
        return false
    end
  end
  
  def end_time 
    self.update_attribute(:end_time, self.start_time + 3.hours)
  end
  
  
end
