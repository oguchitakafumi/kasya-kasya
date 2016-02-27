class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @textboxes = @user.textboxes.order(created_at: :desc)
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Kasya Kasya!"
    redirect_to @user
  else
    render 'new'
    end
  end

   def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
  end


 def set_message
    @user = User.find(params[:id])
  end
end

