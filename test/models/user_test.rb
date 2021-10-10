# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'name_or_email_email_ver' do
    user = User.new(email: 'hoge@example.com', name: '')
    assert_equal 'hoge@example.com', user.name_or_email
  end

  test 'name_or_email_name_ver' do
    user = User.new(email: '', name: 'Test Test')
    assert_equal 'Test Test', user.name_or_email
  end

  test 'follow' do
    me = User.create!(email: 'me@example.com', password: 'aaa666')
    she = User.create!(email: 'she@example.com', password: 'bbb666')
    
    assert_nil Relationship.find_by(following_id: she.id, follower_id: me.id)
    me.follow(she)
    assert Relationship.find_by(following_id: she.id, follower_id: me.id)
  end

  test 'unfollow' do
    me = User.create!(email: 'me@example.com', password: 'aaa666')
    she = User.create!(email: 'she@example.com', password: 'bbb666')

    Relationship.create!(following_id: she.id, follower_id: me.id)
    assert Relationship.find_by(following_id: she.id, follower_id: me.id)
    me.unfollow(she)
    assert_nil Relationship.find_by(following_id: she.id, follower_id: me.id)
  end

  test 'following?' do
    me = User.create!(email: 'me@example.com', password: 'aaa666')
    she = User.create!(email: 'she@example.com', password: 'bbb666')

    Relationship.create!(following_id: she.id, follower_id: me.id)
    assert me.following?(she)
  end

  test 'followed_by?' do
    me = User.create!(email: 'me@example.com', password: 'aaa666')
    she = User.create!(email: 'she@example.com', password: 'bbb666')

    Relationship.create!(following_id: she.id, follower_id: me.id)
    assert she.followed_by?(me)
  end
end
