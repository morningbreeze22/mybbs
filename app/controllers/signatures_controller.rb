class SignaturesController < ApplicationController
  load_and_authorize_resource
  def new
    #@user = User.find(params[:user_id])
    #@signature=Signature.new
  end

  def create
    @user = User.find(params[:user_id])
    @user.signature = Signature.create(signature_params)
    #@signature = @user.signature.create(signature_params)
    redirect_to user_path(@user)
  end


  def index

  end


  def update
    @user= User.find(params[:user_id])
    @user.signature.update(signature_params)
    redirect_to user_path(@user)
  end


  private
  def signature_params
    params.require(:signature).permit(:body)
  end
end
