class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
   load_and_authorize_resource :except => [:grid_view]
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
    redirect_to news_path
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
    Like.create(:user_id=>current_user.id, :news_id=>params[:news_id])
  end
  def comment
    Comment.create(:content=>params[:content], :user_id=>current_user.id, :news_id=>params[:news_id])
  end

  private
    def set_news
      @news = News.find(params[:id])
    end

    def like_params
      params.require(:news).permit(:title, :content, :points, :image_a)
    end

    def comment_params
      params.require(:news).permit(:title, :content, :points, :image_a)
    end

    def news_params
      params.require(:news).permit(:title, :content, :points, :image_a)
    end
    
end
