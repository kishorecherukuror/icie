class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!#check_permision#, :only => [:new, :crezte, :edit, :update, :destroy]
  respond_to :html

  def index
    @posts=Post.all.where(:approved=>true)
  end

  def show
    
  end

  def new
    @post=Post.new
    @post.build_commontable
  end

  def edit
  end

  def create 
      @post = Post.new(post_params)
      @post.save!
    redirect_to "/posts"
  end

  def update
    @news.update(post_params)
    redirect_to "/posts"
  end

  def destroy
    @post.destroy
    redirect_to "/posts"
  end
  def grid_view
    @posts = Post.all
    
  end
 
  private
    def set_post
      @news = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:user_type,commontable_attributes:[:heading, :content, :points, :image])
    end

    def check_permision
      if current_user.role!=1
        redirect_to "/news"
      end
    end
    
end
