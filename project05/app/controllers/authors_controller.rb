class AuthorsController < ApplicationController
  # GET /authors
  # GET /authors.xml
  def index
    @authors = Author.search(params[:search], params[:page])
  end

  # GET /authors/1
  # GET /authors/1.xml
  def show
    @author = Author.find(params[:id])
  end

  # GET /authors/new
  # GET /authors/new.xml
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
    @author = Author.find(params[:id])
  end

  # POST /authors
  # POST /authors.xml
  def create
    @author = Author.new(params[:author])

    if @author.save
        redirect_to(@author, :flash => {:success => 'Article was successfully created.'})
      else
        flash[:error] = "There was a problem creating the author."
        render :action => "new"
      end
  end

  # PUT /authors/1
  # PUT /authors/1.xml
  def update
    @author = Author.find(params[:id])

    if @author.update_attributes(params[:author])
        redirect_to(session[:edit_redirect], :flash => {:success => 'Author was successfully updated.'})
    else
      flash[:error] = "There was a problem updating the author."
      render :action => "edit"
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.xml
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to(authors_url, :flash => {:success => "Author was successfully deleted."})
  end
end
