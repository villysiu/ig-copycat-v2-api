class Users::SessionsController < Devise::SessionsController
  respond_to :json
  
  private

  def respond_with(resource, _opts = {})
  
    # @current_user=current_user
    # puts @current_user.email
    render json: resource, except: [:created_at, :updated_at]
  end
 

  def respond_to_on_destroy
    # head :no_content
    # puts @current_user
    render json: { message: "Logged out." }
  end

end