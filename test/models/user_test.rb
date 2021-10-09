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

    assert_not me.following?(she)
    me.follow(she)
    assert me.following?(she)
  end

  test 'unfollow' do
    me = User.create!(email: 'me@example.com', password: 'aaa666')
    she = User.create!(email: 'she@example.com', password: 'bbb666')

    me.follow(she)
    assert me.following?(she)
    me.unfollow(she)
    assert_not me.following?(she)
  end

  test 'following?' do
    me = User.create!(email: 'me@example.com', password: 'aaa666')
    she = User.create!(email: 'she@example.com', password: 'bbb666')

    me.follow(she)
    assert me.following?(she)
  end

  test 'followed_by?' do
    me = User.create!(email: 'me@example.com', password: 'aaa666')
    she = User.create!(email: 'she@example.com', password: 'bbb666')

    me.follow(she)
    assert she.followed_by?(me)
  end
end
