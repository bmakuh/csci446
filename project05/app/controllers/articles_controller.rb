require "will_paginate"

class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.xml
  
  before_filter :set_edit_return_url, :only => [:edit]
  before_filter :load_authors, :only => [:view, :edit, :update, :new, :create]
  
  def index
    @articles = Article.search(params[:search], params[:page])
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new
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
    
    def load_authors
      @authors = Author.all.collect
    end
end
