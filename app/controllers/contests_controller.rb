class ContestsController < ApplicationController
  before_action :set_contests, only: [:show, :edit, :update, :destroy]
  before_filter :check_permision, :only => [:new, :crete, :edit, :update, :destroy]
  # respond_to :html

  def index
    @contests  = Document.all
   
  end

  def show
    
  end

  def new
    @contest  = Document.new
    @contest.build_commontable
    
  end

  def edit
  end

  def create 
      @contests  = Document.new(contests_params)
      @contests .save
    redirect_to "/contests"
  end

  def update
    @contests .update(contests_params)
    redirect_to contests_path
  end

  def destroy
    @contests .destroy
    redirect_to contests_path
  end
 
  private
    def set_contests
      @contest  = Document.find(params[:id])
    end

    def contests_params
      params.require(:contest).permit(:category, commontable_attributes:[:heading, :content, :points, :image])
    end

    def check_permision
      if current_user.role!=1 && current_user.role!=0 
        redirect_to "/contests"
      end
    end
 
end
