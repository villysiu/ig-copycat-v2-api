class Users::UserController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :find_current_user, :except => [:index]

  def index
    @users=User.all
  end

  def curr_user
    puts "CUUUUUURRRREEENNNNTTT UUUUSSSEEERRR"
    if @user
      render json: @user.id, except: [:created_at, :updated_at], status: :ok
    else 
      puts "hhhhh"
      render json: nil, status: :ok
    end
  end

  def update
    puts "UUUUUUPPPPPDDDDDAAAAATTTTEEE"
    @user.update(name: params[:name]) 
    @user.update(bio: params[:bio]) 
    render json: @user.id, except: [:created_at, :updated_at], status: :ok
  end

  def show
    @user=User.find(params[:id])
    puts "kKKKKKKKKK"
    
  end

  private
  def avatar_params
    params.permit(:name, :bio )
  end
    
  def find_current_user
      @user=current_user
  end
end
