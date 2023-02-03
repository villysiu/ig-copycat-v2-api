class Users::AvatarController < ApplicationController
  before_action :authenticate_user!
  before_action :find_current_user
  def create
  end

  def update

    @user.update(avatar: params[:avatar]) 
    avatar_path=rails_blob_path(@user.avatar, only_path: true) if @user.avatar.attached?
   
      render json: {id: @user.id, avatar: avatar_path}, status: :ok
  end

  def destroy
    puts "destroyyyyyyyyy"
    @user.avatar.purge
    puts @user
    puts @user.avatar
    # @user.avatar.destroy
    @user.update(avatar: nil)
    puts @user.avatar
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
