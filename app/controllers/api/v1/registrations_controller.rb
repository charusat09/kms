class Api::V1::RegistrationsController < Api::V1::BaseController
  before_action :set_user, only: [:update,:destroy]
  before_action :authorize_user!, only: [:update, :destroy]

  def create
    user = User.new(user_params)
    user.authentications.build
    if user.save
      render_success(I18n.t("user.create"),user.as_json)
    else
      render :json => user.errors.full_messages
    end
  end

  # PUT /resource
  def update
    user = @user
    if user.present?
      update_user(user_params,user)
    else
      render_error(I18n.t("user.not_found"),[])
    end
  end

  # DELETE /resource
  def destroy
    user = @user
    if user.present?
      destroy_user(user)
    else
      render_error(I18n.t("user.not_found"),[])
    end
  end

  private

  def destroy_user(user)
    user.destroy
    render_error(I18n.t("user.delete"),[])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone, :city, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def update_user(user_params,user)
    if user.update_attributes(user_params)
      render_success(I18n.t("user.update"),@user.as_json)
    else
      render_error(I18n.t("user.update_not"),@user.as_json)
    end
  end

end
