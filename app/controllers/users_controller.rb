class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.profile_image.attached?
      blob = @user.profile_image.attachment.blob
    end
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else 
      if @user.profile_image.attached? && @user.profile_image.attachment.blob.present?
        @user.profile_image.attachment.blob = blob 
      end
      render :edit
    end  
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
