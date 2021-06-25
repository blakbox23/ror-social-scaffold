module UserHelper
  def check(user)
    return unless current_user != user

    if current_user.friends.include?(user)
      link_to('Delete_friend', { controller: 'friendships', action: 'destroy', id: user.id },
              method: :delete)
    elsif current_user.pending_friends.include?(user)
      p 'Waiting for response'
    elsif current_user.friend_requests.include?(user)
      p 'Person who wants to be friend'
      "#{link_to('Confirm', { controller: 'friendships', action: 'update', id: user.id },
                 method: :patch)} #{link_to('Reject', { controller: 'friendships', action: 'destroy', id: user.id },
                                            method: :delete)}"
    else
      link_to('+ Add_Friend', { controller: 'friendships', action: 'create', friend_id: user.id },
              method: :post)
    end
  end
end
