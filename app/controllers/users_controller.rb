class UsersController < ApplicationController
  load_and_authorize_resource
  #before_action :authenticate_user!    #检查权限
  before_action :authenticate_user!
  def index
    @users=User.all
  end

  def new
    @user = User.new
  end

  def create
    @user= User.new(user_params)
    @user.save
    redirect_to users_path
  end
  def show
    @user = User.find_by_id(params[:id])
  end

  def destroy
    @user=User.find_by_id(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def myarticles
    @articles = current_user.articles
  end

  def myreplies
    @replies = current_user.replies
  end



  private
    def user_params
      params.require(:user).permit(:email, :username, :password, :role)
    end

end
