class Admin::rolesController < Admin::AdminController
  before_filter :require_role, :only => [:show, :edit, :update, :destroy]

  ROLES_PER_PAGE = 20
  
  def new
    @role = role.new(params[:role])
    respond_to do |format|
      if @role.save
        flash[:notice] = 'role was successfully created.'
        format.html {redirect_to admin_role_url(@role)}
        format.xml  {render :xml => @role, :status => :created, :location => @role}
      else
        format.html {render :action => "new"}
        format.xml  {render :xml => @role.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def destroy
    respond_to do |format|
      if @role.destroy
        flash[:notice] = 'role was successfully destroyed.'
        format.html {redirect_to admin_roles_path}
        format.xml  {head :ok}
      else
        flash[:error] = 'role could not be destroyed.'
        format.html {redirect_to admin_role_url(@role)}
        format.xml  {head :unprocessable_entity}
      end
    end
  end
  
  def index
    
  end

  def create
    @role = role.new(params[:role])
    if @role.save
      flash[:notice] = "Registration Successful."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def show
    @role = current_role
  end
  
  def edit
    @role = current_role
  end
  
  def update
    @role = current_role
    if @role.update_attributes(params[:role])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end
