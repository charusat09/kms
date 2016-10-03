class Api::V1::CategoriesController < Api::V1::BaseController
  before_action :set_category, only: [:update, :destroy]
  before_action :authorize_user!

  def index
    @categories = Category.all
  end

  def create
    category = Category.new(category_params)
    if category.save
      render_success(I18n.t("controller.create", model: 'Category'), category.as_json)
    else
      render_error("Some issue prevent category from being saved", category.errors.full_messages)
    end
  end

  def update
    if @category.present?
      if @category.update(category_params)
        render_success(I18n.t("controller.update", model: 'Category'), @category.as_json)
      else
        render_error("Some issue prevent category from being saved", @category.errors.full_messages)
      end
    else
      render_error("category not found", [])
    end
  end

  def destroy
    if @category.present?
      @category.destroy
      render_success(I18n.t("controller.destroy", model: 'Category'), @category.as_json)
    else
      render_error("category not found", [])
    end
  end

  private
  def set_category
    @category = Category.find_by_id(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
