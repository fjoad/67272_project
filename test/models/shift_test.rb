require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  should have_many(:shift_jobs)
  should have_many(:jobs).through(:shift_jobs)
  should belong_to(:assignment)
  should have_one(:store).through(:assignment)
  should have_one(:employee).through(:assignment)

  should validate_presence_of(:date)
  should validate_presence_of(:start_time)
  should validate_presence_of(:assignment_id)
  
  context "Creating context for shift" do
  	setup do
  	  #@ed = FactoryBot.create(:employee)
  	  #@cmu = FactoryBot.create(:store)
  	  #@generic_assign = FactoryBot.create(:assignment, store: @cmu, employee: @ed, start_date: 3.months.ago.to_date, end_date: nil)
  	  #create_employees
  	  #create_stores
  	  #create_assignments
      #create_shifts
    end
    
    teardown do
      #@ed.destroy
      #@cmu.destroy
      #@generic_assign.destroy
      #remove_shifts
      #remove_assignments
      #remove_stores
      #remove_employees
    end
    
    should "Assure that an end_time cant be before the start_time" do
      @bad_shift = FactoryBot.build(:shift)
      @bad_shift.end_time = @bad_shift.start_time - 1.hours
      assert !@bad_shift.valid?
    end

    should "Assure that date is not in the past for a new shift" do
      @bad_shift = FactoryBot.build(:shift, date: Date.current - 2)
      assert !@bad_shift.valid?
    end

    should "Assure that shift cannot be added to an inactive assignment" do
      @bad_shift = FactoryBot.build(:shift, assignment_id: 4)
      assert !@bad_shift.valid?
    end
  end
end
