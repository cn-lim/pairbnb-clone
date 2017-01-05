class UsersController < Clearance::UsersController
  before_action :find_user, only: [:show, :edit, :update]
    
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = user_from_params
    if @user.save
      redirect_to '/users/show'
    else 
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @bookings = @user.bookings
  end

  def update
    if @user.update(user_from_params)
      flash[:success] = "User updated"
      redirect_to @user
    else
      flash[:danger] = "Error"
      render :edit
    end
  end



  private

  def find_user
    if signed_in?
      @user = User.find(params[:id])
    else
    flash[:notice] = "Please sign in"
    redirect_to sign_in_path
    end

  end

  def user_from_params 
    user_params = params[:user] || Hash.new
    email = user_params.delete(:email)
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|

      user.email = email
      user.first_name = first_name
      user.last_name = last_name
      user.password = password
    end
  end
end
