class Api::V1::BaseController < ApplicationController

protect_from_forgery with: :exception
  # disable cookies (no set-cookies header in response)
  before_action :destroy_session

  # disable the CSRF token
  skip_before_action :verify_authenticity_token

  attr_accessor :current_user

  def destroy_session
    request.session_options[:skip] = true
  end

  def api_error(opts = {})
  	render head: true, status: opts[:ststus]
  end

  def authenticate_user!
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)

    user_email = options.blank?? nil : options[:email]
    user = user_email && User.find_by(email: user_email)

    if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
      self.current_user = user
    else
      return unauthenticated!
    end
  end

  def unauthenticated!
	   api_error(status: 401)
	 end

end