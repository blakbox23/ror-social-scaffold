class FriendshipsController < ApplicationController
  def create
    to_befriend = User.find(params[:friend_id])
    @friend = current_user.friendships.new(friend_id: to_befriend.id, confirmed: false)

    if @friend.save
      redirect_to users_path, notice: 'Friend Request Sent'
    else
      redirect_to users_path, notice: 'Friend Request Not Sent'
    end
  end

  def update
    confirming = User.find(params[:id])
    current_user.inverse_friendships.find do |friendship|
      if friendship.user == confirming
        friendship.confirmed = true
        friendship.save
      end
    end
    redirect_to users_path, notice: 'Friend cofirm'
  end

  def destroy
    friend = User.find(params[:id])
    arm = current_user.inverse_friendships + current_user.friendships
    arm.find do |friendship|
      friendship.destroy if friendship.user == friend || friendship.friend == friend
    end
    redirect_to users_path, notice: 'Request rejected'
  end
end
