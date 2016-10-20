
class Api::ApiController < ApplicationController
  before_action :authenticate
  before_action :set_default_response_format

  def authenticate
    authenticate_token || render_unautherized
  end

  def authenticate_token
    authenticate_or_request_with_http_token do |token,options|
      @user = User.find_by_authentication_token(token)
    end
  end

  def set_default_response_format
    request.format :json
  end
end