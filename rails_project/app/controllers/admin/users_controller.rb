class Admin::UsersController < Admin::AdminController

  # GET /admin/users
  def index
    @users = User.all
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
    redirect_to admin_users_path
  end

  # GET /admin/users/new
  def new
    @user = User.new
    @roles = Role.all
  end

  # GET /admin/users/1/edit
  def edit
    @user = User.find(params[:id])
    @roles = Role.all
  end
  
  # POST /admin/users
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        @roles = Role.all
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/users/1
  # PUT /admin/users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @user = User.find_by_id(params[:id])
    unless @user.nil?
      @user.destroy
    end

    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end
end