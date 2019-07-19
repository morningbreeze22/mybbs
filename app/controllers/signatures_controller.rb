class SignaturesController < ApplicationController

  def new
    @signature=Signature.new
  end

  def create
    @user = User.find(params[:user_id])
    @signature = @user.signatures.create(signature_params)
    redirect_to user_path(@user)
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
