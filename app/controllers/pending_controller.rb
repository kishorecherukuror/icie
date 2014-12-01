class PendingController < ApplicationController
  def index
  	@pending=Post.where(:approved=>false)
  end
  def approve
  	@post=Post.find(params[:id])
  	@post.approved=true
  	@post.save!
  end
end
