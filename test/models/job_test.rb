require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # Test relationships
  should have_many(:shift_jobs)
  should have_many(:shifts).through(:shift_jobs)

  should validate_presence_of(:name)

  context "Creating a context for jobs" do
    # create the objects I want with factories
    setup do 
      create_jobs
    end
  
      # and provide a teardown method as well
    teardown do
      remove_jobs
    end
    
    should "Show that there is one active job" do
      assert_equal 1, Job.active.size
      assert_equal ["Janitor"], Job.active.map{|job| job.name}
    end
    
    should "Show that there is one inactive job" do
      assert_equal 1, Job.inactive.size
      assert_equal ["Clerk"], Job.inactive.map{|job| job.name}
    end

    should "List the positions in alphabetical order" do
      assert_equal 2, Job.alphabetical.size
      assert_equal ["Clerk", "Janitor"], Job.alphabetical.map{|job| job.name}
    end
    
    should "Show that job can only be deleted if the job has never been worked by an employee; otherwise it is made inactive" do
      @cmu = FactoryBot.create(:store)
      @faaiz = FactoryBot.create(:employee, first_name: "Faaiz", last_name: "Joad", role: "manager", phone: "949-786-4786")
      @assignment_faaiz = FactoryBot.create(:assignment, employee: @faaiz, store: @cmu, start_date: 6.months.ago.to_date, end_date: nil)
      @shift_faaiz = FactoryBot.create(:shift, assignment: @assignment_faaiz)
      @shift_job_clerk = FactoryBot.create(:shift_job, job: @clerk, shift: @shift_faaiz)

      @clerk.destroy
      assert_equal 1, Job.inactive.size
      assert_equal ["Clerk"], Job.inactive.map{|job| job.name}
      
      @shift_job_clerk.destroy
      @shift_faaiz.destroy
      @assignment_faaiz.destroy
      @faaiz.destroy
      @cmu.destroy
    end
    
  end
end
