class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  before_action :find_photo, :only => [:create, :destroy]
  def index

  end

  def create
    puts params
    comment= @photo.comments.create!(user_id: current_user.id, comment: params[:comment])
    
    render json: {id: comment.id, user_id: current_user.id, comment: comment.comment}, status: :ok

  end

  def destroy

  end

  private
  def comment_params
    puts params
    params.permit(:comment)
  end

  def find_photo
    puts params[:photo_id]
    puts params[:comment]
      @photo=Photo.find(params[:photo_id])
  end

end
