class Users::AvatarController < ApplicationController
  before_action :authenticate_user!
  before_action :find_current_user
  def create
  end

  def update
    puts @user
    puts params[:avatar]
    @user.update(avatar: params[:avatar]) 
    avatar_path=rails_blob_path(@user.avatar, only_path: true) if @user.avatar.attached?
   
    render json: {id: @user.id, avatar: avatar_path}, status: :ok
  end

  def destroy
   
    @user.avatar.purge
    @user.update(avatar: nil)
    render json: @user.id, status: :ok
  end

  private

  def avatar_params
    params.permit(:avatar )
  end
    
  def find_current_user
      @user=current_user
  end
end
