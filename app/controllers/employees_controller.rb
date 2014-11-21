class EmployeesController < ApplicationController
  def index
  	@EmployeesController=User.where(:role=>0)
  end

  def new
  end

  def edit
  end

  def destroy
  	User.find(params[:id]).destroy
  	redirect_to "/employees"
  end
end
