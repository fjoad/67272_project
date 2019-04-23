module Contexts
  module JobContexts
      
    def create_jobs
      @janitor = FactoryBot.create(:job)
  	  @clerk = FactoryBot.create(:job, name: "Clerk", description: "Works on the counter at the cash register", active: false)
  	end

  	def remove_jobs
  	  @janitor.destroy
  	  @clerk.destroy
  	end
  
  end
end