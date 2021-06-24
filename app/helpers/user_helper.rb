module UserHelper
  def check(user)
    if current_user != user
      if current_user.friends.include?(user)
        link_to('Delete friend', { controller: 'friendships', action: 'destroy', id: user.id },
                method: :delete)
      elsif current_user.pending_friends.include?(user)
        p 'Waiting for response'
      elsif current_user.friend_requests.include?(user)
        p 'Person who wants to be friend'
        link_to('confirm', { controller: 'friendships', action: 'update', id: user.id }, method: :patch) +
          link_to('Reject', { controller: 'friendships', action: 'destroy', id: user.id }, method: :delete)
      else
        link_to('+ Add Friend', { controller: 'friendships', action: 'create', friend_id: user.id },
                method: :post)
      end

    end
  end
end
