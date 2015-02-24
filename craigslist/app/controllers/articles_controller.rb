class ArticlesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @article = Article.new
  end

  def index
    @category = Category.find(params[:category_id])
    @articles = Article.all
  end

  def create
    @article = Article.create(article_params)
    p @article
    redirect_to category_articles_path
  end

  def show
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    redirect_to category_articles_path
  end

  def destroy
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to category_articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
