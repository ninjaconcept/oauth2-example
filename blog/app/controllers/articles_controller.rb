class ArticlesController < ApplicationController
  before_filter :login_required
  # Supported options are:
  #  :only => [:oauth_protected_action...]
  #  :except => [:oauth_unprotected_action...]
  # If no options are specified, defaults to oauth for all actions
  oauth_allowed :only => :index
  
  def index
    @articles = Article.find(:all)
    
    respond_to do |format|
      format.html
      format.xml{ render :xml => @articles.to_xml }
      format.json{ render :xml => @articles.to_json }
    end
  end
  
  def recent
    @articles = Article.recent

    respond_to do |format|
      format.html
      format.xml{ render :xml => @articles.to_xml }
    end
  end
  
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new(:article => @article)
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = "Successfully created article."
      redirect_to @article
    else
      render :action => 'new'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "Successfully updated article."
      redirect_to @article
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Successfully destroyed article."
    redirect_to articles_url
  end
end
