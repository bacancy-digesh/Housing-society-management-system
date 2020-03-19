# frozen_string_literal: true

require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test 'notice' do
    mail = NoticeMailer.notice
    assert_equal 'Notice', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
