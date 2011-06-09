# To change this template, choose Tools | Templates
# and open the template in the editor.

class CommentsController < ApplicationController

  before_filter :authenticate

  def new
    @comment = Micropost.comments.new(:id => params[:id])
  end

  def create
    @micropost = Micropost.find(params[:comment][:msg_id])
    @comment = @micropost.comments.build(params[:comment])
    @comment.save!
    redirect_to root_path
  end

end
