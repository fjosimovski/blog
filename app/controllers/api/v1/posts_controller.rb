class Api::V1::PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
    respond_to do |format|
      format.json  { render :json => @posts }
      format.xml  { render :xml => @posts }
    end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.json  { render :json => @post }
      format.xml  { render :xml => @post }
    end
  end
end
