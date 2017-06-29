class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def create
    @article = Article.new(article_params)
	@article.save
	redirect_to @article
  end

  def new
    @users = User.all.map{|u| [u.lname, u.id]}
  end
  
  def show
    @articles = Article.find(params[:id])
	@user = User.find(@articles.user_id)
  end
  
  private
    def article_params
	  params.require(:article).permit(:title, :text, :user_id)
	end
end
