class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
                    
  def show
    @user = User.find(params[:id])
    @title =@user.name 
    @mail = @user.email     
    @tasks = @user.tasks.paginate(:page => params[:page]) 
    @task = Task.new
  end

  def new_test
    @title = "Registering"
    if request.post? 
      Register.start_reg_email(params[:email]).deliver
      redirect_to root_path
    end    
    
  end
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save      
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # Обработка успешного сохранения.
    else
      @title = "Sign up"
      @user.email=params[:email]
      render 'new'
    end
  end
  
  def edit
    @title = "Edit user"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
    private

    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end