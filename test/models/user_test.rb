require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Test relationships
  should belong_to(:employee)
  
  #validations
  should allow_value("fjoad@andrew.cmu.edu").for(:email)
  should allow_value("faaizjoad@gmail.com").for(:email)
  should allow_value("faaiz_joad@hotmail.com").for(:email)
  
  should_not allow_value("bad").for(:email)
  should_not allow_value(nil).for(:email)
  should_not allow_value("12345").for(:email)
  should_not allow_value("sadfafsgasfdf123131").for(:email)
  should_not allow_value("com.faaiz.@.c").for(:email)
  
  
  #create contexts
  context "user contexts" do
  
    #create factories
    setup do 
      @test = FactoryBot.create(:employee)
      @test_user = FactoryBot.create(:user, employee: @test)
    end
    
    teardown do
      @test.destroy
    end
    
    #test scopes and methods 
    should "Assure that user can only be added to an active employee" do
      @employee = FactoryBot.build(:employee)
      @user = FactoryBot.build(:user, email:"user@cmu.edu", employee: @employee)
      assert @user.employee_is_active_in_system
      assert @test_user.valid?
      @bad = FactoryBot.build(:user, email:"bad@cmu.edu", employee: @inactive)
      assert !@bad.valid?
      @bad.destroy
    end
    
    should "Show that user is automatically deleted when employee is deleted" do
      @test.destroy
      assert @test.destroyed?
      assert @test_user.destroyed?
    end
  end
end
