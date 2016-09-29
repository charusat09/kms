class Api::V1::BaseController < ApplicationController
  skip_before_action  :verify_authenticity_token

  def authorize_user!
    if user[:auth_token].present?  
      @token = Authentication.find_by(auth_token: user[:auth_token])
      if token.present?
        @current_user = token.user
      else
        render :json=>({:errors => "Invalid authtoken", :status => 0}.to_json)
      end  
    end
  end

end

