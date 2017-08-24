class FriendshipsController < ApplicationController
  before_action :is_authenticated?


  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to user_path(current_user)
    else
      flash[:error] = "Unable to add friend."
      redirect_to user_path(current_user)
    end
  end

  def transfer
    @friend_id = User.find(params[:id])
  end

  def newtransfer
    @friend = User.find(params[:id])

    friendship = Friendship.find_by(friend_id: @friend.id, user_id: current_user.id)
    friendship.transfer_to_friend(params[:transfer][:amount].to_i)
    redirect_to user_path(current_user)
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end

end
