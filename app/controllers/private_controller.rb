class PrivateController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  
  def test
    @user=current_user
      render json: current_user.id, except: [:created_at, :updated_at],
      status: :ok
  end

  def index
    @users=User.all
    
    # render json: @users, except: [:created_at, :updated_at], 
    # status: :ok
  end

  def update
    @user=current_user
    @user.update(name: params[:name])
    @user.update(bio: params[:bio])
   
    if params[:avator]=="null"
      @user.update(avator: nil)
    else
      @user.update(avator: params[:avator]) 
    end
    
  end

  private

  def user_params
      params.permit(:name, :bio, :avator )
  end
  
 
end
