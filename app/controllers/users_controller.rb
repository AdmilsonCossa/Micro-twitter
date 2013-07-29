class UsersController < ApplicationController
  
  def index
    
    @users = User.all
    
    respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @users }
    
  end
end
  
  
  
  def new

      @user = User.new
      

  end


  def edit

      @user = current_user

  end

  def show 
    @user = User.find(params[:user_id])
    respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @user }
    
  end
end

  def create

      @user = User.new(params[:user])

      if @user.save

        flash[:notice] = "Registered successfully!"

        redirect_to "/"

      else

        render :action => 'new'

  end

  end


    def update

      @user = current_user


      if @user.update_attributes params[:user]

        flash[:notice] = "Update successful!"

        redirect_to "/my_account"

      else

        render :action => :edit

      end

end
end