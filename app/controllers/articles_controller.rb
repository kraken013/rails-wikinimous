class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new # GET
    @article = Article.new
  end

  def create # POST
    @article = Article.new(article_params)
    @article.save

    redirect_to @article
  end

  def edit # GET
    @article = Article.find(params[:id])
  end

  def update # PATCH
    @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to @article
  end

  def destroy # DELETE
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
