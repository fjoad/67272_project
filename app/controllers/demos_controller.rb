class DemosController < ApplicationController
    def new 
    end 
    
    def create 
        user = User.find_by(email: params[:demo][:email])
        if user && user.authenticate(params[:demo][:password])
            role = user.user_role
            login(user)
            if role == 'employee'
                redirect_to employee_page_index_path
            elsif role == 'manager'
                redirect_to manager_page_index_path
            elsif role == 'admin'
                redirect_to admin_page_index_path
            end
        else
           flash.now[:danger] = "Invalid email or password or role"
           render 'new'
        end
    end
    
    def destroy 
        logout
        redirect_to root_url
    end
end
