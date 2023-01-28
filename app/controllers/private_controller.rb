class PrivateController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  
  def test
      render json: current_user, except: [:created_at, :updated_at],
      status: :ok
  end

  def index
    @users=User.all
    puts "are w here"
    # render json: @users, except: [:created_at, :updated_at], 
    # status: :ok
  end

  def update
    @user=current_user
    @user.update(name: params[:name])
    @user.update(bio: params[:bio])
    @user.update(avator: params[:avator])
    
    # render json:current_user, except: [:created_at, :updated_at],
    #   status: :ok
  end

  private

  def user_params
      params.permit(:name, :bio, :avator )
  end
  
 
end
