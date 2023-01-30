class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save
    sign_in(resource_name, resource)
    render json: resource.id, except: [:created_at, :updated_at]
  end
  

end