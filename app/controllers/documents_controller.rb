class DocumentsController < ApplicationController
	 before_action :set_documents, only: [:show, :edit, :update, :destroy]
  before_filter :check_permision, :only => [:new, :crete, :edit, :update, :destroy]
  respond_to :html

  def index
    @documents  = Document.all
    respond_with(@documents )
  end

  def show
    respond_with(@documents )
  end

  def new
    @document  = Document.new
    @document.build_commontable
    respond_with(@documents )
  end

  def edit
  end

  def create 
      @documents  = Document.new(documents_params)
      @documents .save
    redirect_to "/documents"
  end

  def update
    @documents .update(documents_params)
    redirect_to documents_path
  end

  def destroy
    @documents .destroy
    redirect_to documents_path
  end
 
  private
    def set_documents
      @document  = Document.find(params[:id])
    end

    def documents_params
      params.require(:document).permit(:category, commontable_attributes:[:heading, :content, :points, :image])
    end

    def check_permision
      if current_user.role!=1 && current_user.role!=0
        redirect_to "/documents"
      end
    end
 
end
