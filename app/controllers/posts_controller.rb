class PostsController < ApplicationController
  before_filter :authenticate_user, :only => [:new]
  before_filter :check_for_user

  def index
    @posts = Post.all.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.json  { render :json => @posts }
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html
      format.json  { render :json => @post }
    end
  end

  def create
    @post = Post.new(posts_params)
    respond_to do |format|
      if @post.save
        format.html  { redirect_to(root_path,
                      :notice => 'The post was successfully created.') }
        format.json  { render :json => root_path,
                      :status => :created, :location => @post }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @post.errors,
                      :status => :unprocessable_entity }
      end
    end
  end


  private

  def posts_params
    params.require(:post).permit(:title, :description, :username)
  end
end
