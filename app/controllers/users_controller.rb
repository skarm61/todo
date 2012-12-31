class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
           
    
  def callback
    #uid=8912155&first_name=%D0%90%D0%BD%D0%B4%D1%80%D0%B5%D0%B9&last_name=%D0%A1%D0%B0%D0%BF%D0%BE%D0%B6%D0%BD%D0%B8%D0%BA%D0%BE%D0%B2&photo=http://cs421018.userapi.com/v421018155/109a/He9rhAlecUw.jpg&photo_rec=http://cs421018.userapi.com/v421018155/109e/OMIVe-AVV4s.jpg&hash=deb413bc14dace3d16ad68fca1a77299
    
    redirect_to root_url, alert: 'Error' and return if session[:state].present? && session[:state] != params[:state]    
    @vk = VkontakteApi.authorize(code: params[:code])
    current_user.vk_token= @vk.token
    current_user.vk_id = @vk.user_id    
    
    redirect_to current_user
  end  
               
                    
  def show
    @user = User.find(params[:id])
    @user_id=params[:id]
        
    @title =@user.name 
    @mail = @user.email    
     
  end

  def new_user
    @title = "Registering"
    if request.post? 
      Register.start_reg_email(params[:email]).deliver
      redirect_to root_path
    end      
  end
  
  def new
    @title = "Registering"
    @user=User.new
    @user.email=params[:email]
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
    #current_user.id_vk=8912155 
    if current_user.id_vk.nil?
      @vk=true
      srand
      session[:state] ||= Digest::MD5.hexdigest(rand.to_s)    
      @vk_url = VkontakteApi.authorization_url(scope: [:friends, :groups, :offline, :notify], state: session[:state]) 
    end
    
    
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