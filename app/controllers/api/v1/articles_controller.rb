class Api::V1::ArticlesController < Api::V1::BaseController

  before_filter :authorize_user!,only:[:create,:update,:destroy]
  
  def index
    @articles = Article.all
  end

  def create
    article  =  @current_user.articles.create(article_params)
    images = []
    params[:article][:image].each do |i|
      images << article.pictures.create(image:params[:article][:image][i])
    end
    categories_array = params[:article][:categories].map { |k,v| v }
    categories = Category.where(id: categories_array)
    article.categories << categories
    render json:{article:article,categories:categories,images:images}
  end


  def update
    article = @current_user.articles.find(params[:id])

    if article.present?
        article.update_attributes(article_params)
        images = []
        if params[:article][:image].present?
           article.pictures.destroy_all if article.pictures.present?
          params[:article][:image].each do |i|
            images << article.pictures.create(image:params[:article][:image][i])
          end
        end
        if params[:article][:categories].present?
          article.categories.destroy_all if article.categories.present?
          categories_array = params[:article][:categories].map { |k,v| v }
          categories = Category.where(id: categories_array)
          article.categories << categories
        end
        render json:{article:article,categories:categories,images:images}
      else
        render_error("Article not found",nil)
    end
  end

  def show
    article = Article.find(params[:id])
    if article.present?
      render json:{article:article,categories:article.categories,pictures:article.pictures}
    else
      render_error("No article found",nil)
    end
  end

  def destroy
     article = @current_user.articles.find_by_id(params[:id])
    # find Article
      unless article.present?
        render_error("Access denied",nil)
        return
      end
    #delete Article
    msg = "Artical Deleted"  if article.present? && article.destroy
    render_error(msg,nil)
  end

  def article_params
    params.require(:article).permit(:title,:s_description,:l_description,:image,:categories)
  end

end
