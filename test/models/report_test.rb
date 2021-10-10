# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @target_user = User.new(email: 'target@example.com', password: '666666')
    @non_target_user = User.new(email: 'iamnottarget@example.com', password: '555555')
    @report = Report.new(user: @target_user, title: 'test', content: 'test', created_at: Date.new(2020, 10, 10))
  end
  
  test 'editable' do
    assert @report.editable?(@target_user)
    assert_not @report.editable?(@non_target_user)
  end

  test 'created_on' do
    assert_equal @report.created_on, Date.new(2020, 10, 10)
    assert_not_equal @report.created_on, Date.new(2010, 11, 11)
  end
end
