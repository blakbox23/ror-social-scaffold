require 'rails_helper'

RSpec.describe 'Friendship', type: :model do
  it 'should have user' do
    friendship = Friendship.new(friend_id: 1, confirmed: false)
    expect(friendship.save).to be(false)
  end
  it 'should have friend' do
    friendship = Friendship.new(user_id: 2, confirmed: false)
    expect(friendship.save).to be(false)
  end
  it 'should belong to the user' do
    a = Friendship.reflect_on_association(:friend)
    expect(a.macro).to eq(:belongs_to)
  end
  it 'should belong to the user' do
    a = Friendship.reflect_on_association(:user)
    expect(a.macro).to eq(:belongs_to)
  end
end