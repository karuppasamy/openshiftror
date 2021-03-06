class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    @user = User.create(permitted_params)

    # {
    #   "user": {
    #     "email": "oiw@yo.com",
    #     "name": "fine",
    #     "country": "india",
    #     "contact": "111",
    #     "password": "welcome",
    #     "password_confirmation": "welcome"
    #   }
    # }
    if @user.save
      render json: { message: 'Success', user: @user, dollar: 10 }
    else
      render json: @user.errors
    end
    # super
    # build_resource(sign_up_params)

    # resource.save
    # yield resource if block_given?
    # if resource.persisted?
    #   if resource.active_for_authentication?
    #     set_flash_message! :notice, :signed_up
    #     sign_up(resource_name, resource)
    #     # respond_with resource, location: after_sign_up_path_for(resource)
    #     render json: { user: resource, dollar: 10 }
    #   else
    #     set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
    #     expire_data_after_sign_in!
    #     respond_with resource, location: after_inactive_sign_up_path_for(resource)
    #     # render json: resource
    #   end
    # else
    #   clean_up_passwords resource
    #   set_minimum_password_length
    #   respond_with resource
    # end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :country, :contact, :image])
  # end

  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in)
  end

  def permitted_params
    params.permit(:email, :password, :password_confirmation, :image, :country, :name, :contact)
  end
  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attributes])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
