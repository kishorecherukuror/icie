class EmployeesController < ApplicationController
  def index
  	@employees=User.where(:role=>0)
  end

  def new
  	@employee = User.new
  	@url="/employee"
  end

  def edit
  	@employee=User.find(params[:id])
  	@url=employee_path(@employee)
  end

  def create
  	@employee = User.new(employee_params)
      @employee.save
    redirect_to "/employees"
  end

  def update
  	@employee=User.find(params[:id])
    @employee.update(employee_params)
    redirect_to employees_path
  end

  def destroy
  	User.find(params[:id]).destroy
  	redirect_to "/employees"
  end
  private
  	def employee_params
      params.require(:user).permit(:first_name, :middle_name, :last_name, :contact, :address, :email, :password, :passwordpassword_confirmation)
    end
end
