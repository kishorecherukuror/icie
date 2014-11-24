class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_filter :check_permision, :only => [:new, :crezte, :edit, :update, :destroy]
  respond_to :html

  def index
    @news = News.all
    respond_with(@news)
  end

  def show
    respond_with(@news)
  end

  def new
    @news = News.new
    respond_with(@news)
  end

  def edit
  end

  def create 
      @news = News.new(news_params)
      @news.save
    redirect_to "/news"
  end

  def update
    @news.update(news_params)
    redirect_to news_path
  end

  def destroy
    @news.destroy
    redirect_to news_path
  end
  def grid_view
    @news = News.all
    
  end
  def like
    @news = News.find(params[:news_id])
    Like.create(:user_id=>current_user.id, :news_id=>params[:news_id])
  end

  def unlike
    @news = News.find(params[:news_id])
    Like.find_by(:user_id=>current_user.id, :news_id=>params[:news_id]).destroy
  end

  def comment
    @news = News.find(params[:news_id])
    Comment.create(:content=>params[:content], :user_id=>current_user.id, :news_id=>params[:news_id])
  end

  private
    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:title, :content, :points, :image_a)
    end

    def check_permision
      if current_user.role!=1
        redirect_to "/news"
      end
    end
    
end
