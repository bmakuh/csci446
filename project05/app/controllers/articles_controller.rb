require "will_paginate"

class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.xml
  
  before_filter :set_edit_return_url, :only => [:edit]
  
  def index
    @articles = Article.paginate :per_page => 10, :page => params[:page],
                                 :conditions => ['title like ?', "%#{params[:search]}%"],
                                 :order => 'title'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])
    #@article.update_attribute(:edit_count, Article.increment_counter)

      if @article.save
        redirect_to(@article, :flash => {:success => 'Article was successfully created.'})
      else
        flash[:error] = "There was a problem creating the article."
        render :action => "new"
      end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])
    #Article.increment_counter(:edit_count, :id)

      if @article.update_attributes(params[:article])
        redirect_to(session[:edit_redirect], :flash => {:success => 'Article was successfully updated.'})
      else
        flash[:error] = "There was a problem updating the article."
        render :action => "edit"
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to(articles_url, :flash => {:success => "Article was successfully deleted."})
  end
  
  private
  
    def set_edit_return_url
      session[:edit_redirect] = request.referrer
    end
end
