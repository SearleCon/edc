class CommentsController < ApplicationController
  respond_to :html, :js

  before_action :load_commentable
  before_action :get_resource, only: [:destroy]

  def index
    @comments = @commentable.comments
    respond_with @comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.create(comment_params)
    respond_with(@comment)
  end

  def destroy
    respond_with(@comment)
  end

  private
  def load_commentable
   resource, id = request.path.split('/')[1, 2]
   @commentable = resource.classify.constantize.find(id)
  end

  def get_resource
    @comment = @commentable.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end


end