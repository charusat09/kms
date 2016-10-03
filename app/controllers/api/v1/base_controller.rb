class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  def render_success(message,data)
    render json: {
      status: 'success',
      message: message,
      data:   data
    } 
  end
  def render_error(errors,data)
    render json: {
      status: 'error',
      data:   data,
      errors: errors
    }, status: 422
  end 

  def authorize_user!
    if params[:auth_token].present?  
      @token = Authentication.find_by(auth_token: params[:auth_token])
      if @token.present?
        @current_user = User.find(@token.user_id)
        unless @current_user.present? 
          render_json({:errors => "No user found with this #{params[:auth_hash]} auth token", :status => 404}.to_json)
        end
      else
        render_json({:errors => "Invalid authtoken", :status => 0}.to_json)
      end  
    end
  end
end