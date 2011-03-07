require "will_paginate"

class Member::GamesController < Member::MemberController
  before_filter :require_user, :only => [:show, :new, :create, :edit, :update, :destroy]
  filter_resource_access
  
  def index
    @games = Game.search(params[:search], params[:page])
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params[:game])
    if @game.save
      flash[:notice] = "Successfully created game."
      redirect_to @game
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @game.update_attributes(params[:game])
      flash[:notice] = "Successfully updated game."
      redirect_to @game
    else
      render :action => 'edit'
    end
  end

  def destroy
    @game.destroy
    flash[:notice] = "Successfully destroyed game."
    redirect_to games_url
  end
  
end
