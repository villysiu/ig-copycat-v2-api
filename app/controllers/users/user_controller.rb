class Users::UserController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :curr_user]
  before_action :find_current_user, :except => [:index]

  def index
    @users=User.all
  end

  def curr_user
    if @user
      render json: @user.id, except: [:created_at, :updated_at], status: :ok
    else 
      render json: nil, status: :ok
    end
  end

  def update
    @user.update(name: params[:name]) 
    @user.update(bio: params[:bio]) 
    render json: @user.id, status: :ok
  end

  private
  def avatar_params
    params.permit(:name, :bio )
  end
    
  def find_current_user
      @user=current_user
  end
end
