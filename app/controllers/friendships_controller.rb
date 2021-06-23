class FriendshipsController < ApplicationController
    def create
    to_befriend = User.find(params[:friend_id])
     @friend = current_user.friendships.new(friend_id: to_befriend.id, confirmed: false)

      if  @friend.save
        redirect_to users_path, notice: 'Friend Request Sent'
      else
        redirect_to users_path, notice: 'Friend Request Not Sent'
      end
    end

    def show
       
    end
end