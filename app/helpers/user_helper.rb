module UserHelper
 def self_check
    if !(current_user == user)
      link_to ('+ Add Friend', (:controller => "friendships", :action => "create", :friend_id => user.id), method: :post) 
   
   end 
 end
end