class Api::V1::SessionsController < Api::V1::BaseController
  before_action :set_user, only: [:destroy]
  before_action :authorize_user!, only: :destroy
  # POST /resource/sign_in
  def create
    if params[:email].present?
      user = User.find_by_email(params[:email])
      if user.valid_password?(params[:password])
        token = user.authentications.build
        token.save
        sign_in(user)
        render :json => user
      else
        render_error(I18n.t("user.password"),[])
      end
    else
      render_error(I18n.t("user.email"),[])
    end
  end

  # DELETE /resource/sign_out
  def destroy
    @token.destroy
    sign_out(@current_user)
  end
end
