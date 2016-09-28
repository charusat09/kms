class Api::V1::ArticlesController < Api::V1::BaseController

  def create
    article  =  User.first.articles.create(article_params)
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
  end

  def show
    article = Article.find(params[:id])
    render json:{article:article,categories:article.categories,pictures:article.pictures}
  end

  def destroy
    Article.find(params[:id]).destroy
    render json:{message:"Article Deleted Successfully"}
  end

  def article_params
    params.require(:article).permit(:title,:s_description,:l_description,:image,:categories)
  end

end
