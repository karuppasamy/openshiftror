class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_action :add_headers
  before_action :authenticate_user!

  # before_action :validate_user, unless: :devise_controller?

  # def validate_user
  #     respond_to do |format|
  #       if user_signed_in?
  #         format.json { render json: { message: 'Success' } }
  #       else
  #         format.json { render json: 'User session is not created' }
  #         format.html { redirect_to '/users/sign_in'}
  #       end
  #     end
  # end

  private

  def add_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
