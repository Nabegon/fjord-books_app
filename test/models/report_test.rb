# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable' do
    target_user = User.create!(email: 'target@example.com', password: '666666')
    no_target_user = User.create!(email: 'iamnottarget@example.com', password: '555555')

    post = Report.new(user_id: target_user.id, title: 'test', content: 'test')
    assert post.editable?(target_user)
    assert_not post.editable?(no_target_user)
  end

  test 'created_on' do
    user = User.create!(email: 'target@example.com', password: '666666')
    post = Report.create!(user_id: user.id, title: 'test', content: 'test')
    assert post.created_on == (Date.current)
  end
end
