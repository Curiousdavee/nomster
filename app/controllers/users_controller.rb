class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.comments.destroy(comment_params.merge(user: current_user))
  #   redirect_to user_path(@user)
  # end


  # private

  # def comment_params
  #   params.require(:comment).permit(:message, :rating)
  # end

end
