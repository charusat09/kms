class Api::V1::SessionsController < Api::V1::BaseController
  # before_action :set_user, only: [:destroy]
  before_action :authorize_user!, only: :destroy
  # POST /resource/sign_in
  def create
    if user[:email].present?
      user = User.find_by_email(user[:email])
      if user.valid_password?(user[:password])
        sign_in_user(user)
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
    render_error(I18n.t("user.logout"),[])
  end

  private

  def sign_in_user(user)
    token = user.authentications.build
    token.save
    sign_in(user)
    render :json => user 
  end
end
