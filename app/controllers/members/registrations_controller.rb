class Members::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

protected
  # Don't reqire the password to update a Member
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(member)
    edit_member_registration_path
  end

  # You can put the params you want to permit in the empty array.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :enable_vending_machine])
  end

  # You can put the params you want to permit in the empty array.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :enable_vending_machine])
  end
end
