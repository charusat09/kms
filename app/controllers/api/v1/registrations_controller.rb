class Api::V1::RegistrationsController < Api::V1::BaseController
  before_action :set_user, only: [:edit, :update,:destroy]
  before_action :authorize_user!, only: [:update, :destroy]

  def create
    user = User.new(user_params)
    user.authentications.build
    if user.save
      render :json => @user
    else
      render :json => user.errors.full_messages
    end
  end

  # GET /resource/edit
  def edit
  end

  # PUT /resource
  def update
    if @user.present?
      if @user.update_attributes(user_params)
        render :json => @user
      else
        render_error(["User successfully Not Updated.."],@user.as_json)
      end
    else
      render_error(["User Not Found."],[])
    end
  end

  # DELETE /resource
  def destroy
    if @user.present?
      @user.destroy
      render_error(["User successfully deleted.."],[])
    else
      render_error(["User Not Found."],[])
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :phone, :city, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end
end
