class ArticlesController < ApplicationController
  def index
    #Method to show all articles
    @articles = Article.all
  end

  def show
    #Method to show one article based on id
    @article = Article.find(params[:id])
  end

  def new
    #Initialize a new article but does not save it.
    #By default will render app/views/articles/new.html.erb
    @article = Article.new
  end

  def create
    #instantiates a new article with values for the title and body, and attempts to save it. If the article is saved successfully, the action redirects the browser to the article's page
    @article = Article.new(article_params)

    if @article.save
      # redirect_to will cause the browser to make a new request,
      redirect_to @article
    else
      # renders the specified view for the current request
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to root_path
    end
  end

  private
   def article_params
     params.require(:article).permit(:title, :body)
   end
end
