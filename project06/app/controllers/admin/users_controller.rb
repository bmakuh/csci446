class Admin::UsersController < Admin::AdminController
  before_filter :require_user, :only => [:show, :edit, :update, :destroy]

  USERS_PER_PAGE = 20
  
  def new
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.html {redirect_to admin_user_url(@user)}
        format.xml  {render :xml => @user, :status => :created, :location => @user}
      else
        format.html {render :action => "new"}
        format.xml  {render :xml => @user.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def destroy
    respond_to do |format|
      if @user.destroy
        flash[:notice] = 'User was successfully destroyed.'
        format.html {redirect_to admin_users_path}
        format.xml  {head :ok}
      else
        flash[:error] = 'User could not be destroyed.'
        format.html {redirect_to admin_user_url(@user)}
        format.xml  {head :unprocessable_entity}
      end
    end
  end
  
  def index
    
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration Successful."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def show
    @user = current_user
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end
