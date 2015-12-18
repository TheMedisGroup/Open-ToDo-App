class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token

  private

  def authenticated?
    authenticate_or_request_with_http_basic { |password, email| User.where( password: password, email: email).present? }
  end

end
