class PagesController < ApplicationController

  def home
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
      @comment =Comment.new
    end
  end

  def comments
    @comment = Comment.new(:msg_id => params[:id])
  end
  def contact
  end

end
