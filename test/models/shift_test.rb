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
  	  create_employees
  	  create_stores
  	  create_assignments
      create_shifts
    end
    
    teardown do
      #@ed.destroy
      #@cmu.destroy
      #@generic_assign.destroy
      remove_shifts
      remove_assignments
      remove_stores
      remove_employees
    end
    
    should "end_time cannot be less than start_time" do
      @bad_shift = FactoryBot.build(:shift)
      @bad_shift.end_time = @bad_shift.start_time - 10.hours
      assert !@bad_shift.valid?
    end

    should "date is not in the past" do
      @bad_shift = FactoryBot.build(:shift, date: Date.today - 10.days)
      assert !@bad_shift.valid?
    end

    should "shift cannot be added to an inactive assignment" do
      @inactive = FactoryBot.build(:assignment, employee: @faaiz, store: @cmu, end_date: Date.today - 10.days)
      @bad_shift = FactoryBot.build(:shift, assignment: @inactive)
      assert !@bad_shift.valid?
    end
    
    should "past shift cant be deleted" do
      @past_shift = FactoryBot.create(:shift, assignment: @promote_ben, date: Time.now - 100.hours)
      @future_shift = FactoryBot.create(:shift, assignment: @promote_ben, date: Time.now + 100.hours)
      @past_shift.destroy
      assert !@past_shift.destroyed?
      @future_shift.destroy
      assert @future_shift.destroyed?
    end
    
    should "Check if completed? works" do
      @past_shift = FactoryBot.create(:shift, assignment: @promote_ben, date: Date.today - 100.days)
      assert @past_shift.completed?
      @past_shift.destroy
    end

    should "Check if end_time automatically set" do
      @shift = FactoryBot.create(:shift, assignment: @promote_ben, start_time: Time.now)
      assert_in_delta 1, @shift.end_time.to_i, Time.now.to_i + 3.hours.to_i
      @shift.destroy
    end
    
    should "Check if start_now works" do
      @new_shift = FactoryBot.create(:shift, assignment: @promote_ben, start_time: Time.now)
      @new_shift.start_now
      assert_in_delta 1, Time.now.to_i, @new_shift.start_time.to_i
      @new_shift.destroy
    end

    should "Check if end_now works" do
      @shift = FactoryBot.create(:shift, assignment: @promote_ben, start_time: Date.current + 2.hours)
      @shift.end_now
      assert_in_delta 1, Time.now.to_i, @shift.end_time.to_i
      @shift.destroy
    end
    
    should "have a scope completed that works" do
      @past_shift = FactoryBot.create(:shift, assignment: @promote_ben, date: Date.today - 100.days)
      @test_janitor = FactoryBot.create(:job)
      @shift_past_janitor = FactoryBot.create(:shift_job, shift: @past_shift, job: @test_janitor)

      assert_equal [3], Shift.completed.map{|shift| shift.id}
      @past_shift.destroy
      @test_janitor.destroy
      @shift_past_janitor.destroy
    end
    
    should "have a scope incompleted that works" do
      @past_shift = FactoryBot.create(:shift, assignment: @promote_ben, date: Date.today - 100.days)
      @test_janitor = FactoryBot.create(:job)
      @shift_past_janitor = FactoryBot.create(:shift_job, shift: @past_shift, job: @test_janitor)
      assert_equal [1, 2, 3], Shift.incompleted.map{|shift| shift.id}.sort
    end

    should "have a scope for_store that works" do
      @past_shift = FactoryBot.create(:shift, assignment: @promote_ben, date: Date.today - 100.days)
      @test_janitor = FactoryBot.create(:job)
      @shift_past_janitor = FactoryBot.create(:shift_job, shift: @past_shift, job: @test_janitor)
      assert_equal [1, 2, 3], Shift.for_store(3).map{|shift| shift.id}.sort
    end

    should "have a scope for_employee that works" do
      @past_shift = FactoryBot.create(:shift, assignment: @promote_ben, date: Date.today - 100.days)
      @test_janitor = FactoryBot.create(:job)
      @shift_past_janitor = FactoryBot.create(:shift_job, shift: @past_shift, job: @test_janitor)
      assert_equal [1, 2], Shift.for_employee(2).map{|shift| shift.id}.sort
    end
    
  end
end
